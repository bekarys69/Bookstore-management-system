public static void login() {
     
    JFrame f=new JFrame("Login");//создание экземпляра JFrame
    JLabel l1,l2;  
    l1=new JLabel("Username");  //cоздание метки Username
    l1.setBounds(30,15, 100,30); //ось x, ось y, ширина, высота 
     
    l2=new JLabel("Password");  //cоздание метки Password
    l2.setBounds(30,50, 100,30);    
     
    JTextField F_user = new JTextField(); //создание текстового поля для пользователя
    F_user.setBounds(110, 15, 200, 30);
         
    JPasswordField F_pass=new JPasswordField(); //создание текстового поля для пароля
    F_pass.setBounds(110, 50, 200, 30);
       
    JButton login_but=new JButton("Login");//создание экземпляра JButton для Login Button
    login_but.setBounds(130,90,80,25);//размеры кнопки
    login_but.addActionListener(new ActionListener() {
    
     public void actionPerformed(ActionEvent e){ 
 
        String username = F_user.getText(); //сохранение пользователя в переменной "username"
        String password = F_pass.getText(); //сохранение пароля в переменной "password"

 if(username.equals("")) 
        {
            JOptionPane.showMessageDialog(null,"Please enter username");
        } 
        else if(password.equals("")) 
        {
            JOptionPane.showMessageDialog(null,"Please enter password"); 
        }
        else { //если оба поля заполнены, то для входа в систему идёт проверка пользователя
            //System.out.println("Login connect");
            Connection connection=connect(); //подключение к БД
            try
            {
            Statement stmt = connection.createStatement();
              stmt.executeUpdate("use library"); 
              String st = ("select * from users where username='"+username+"' and password='"+password+"'"); 
              ResultSet rs = stmt.executeQuery(st); 
              if(rs.next()==false) {
                  System.out.print("No user");  
                  JOptionPane.showMessageDialog(null,"Wrong Username/Password!"); 
 
              }
              else {
                  f.dispose();
                rs.beforeFirst(); 
                while(rs.next())
                {
                  String admin = rs.getString("admin"); 
                  //System.out.println(admin);
                  String UID = rs.getString("uid"); 
                  if(admin.equals("1")) {
                      admin_menu(); 
                  }
                  else{
                      user_menu(UID);
                  }
              }
              }
            }
            catch (Exception ex) {
                 ex.printStackTrace();
        }
        }
    }               
    });
 
     
    f.add(F_pass); 
    f.add(login_but);
    f.add(F_user); 
    f.add(l1); 
    f.add(l2); 
     
    f.setSize(400,180);
    f.setLayout(null);
    f.setVisible(true);
    f.setLocationRelativeTo(null);
     
}
