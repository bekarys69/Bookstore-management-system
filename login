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

 if(username.equals("")) //если имя пользователя null
        {
            JOptionPane.showMessageDialog(null,"Please enter username"); //отображение окна с сообщением
        } 
        else if(password.equals("")) //если пароль null
        {
            JOptionPane.showMessageDialog(null,"Please enter password"); //отображение окна с сообщением
        }
        else { //если оба поля заполнены, то для входа в систему идёт проверка пользователя
            //System.out.println("Login connect");
            Connection connection=connect(); //подключение к БД
            try
            {
            Statement stmt = connection.createStatement();
              stmt.executeUpdate("use library"); //использование БД "library"
              String st = ("select * from users where username='"+username+"' and password='"+password+"'"); //получение имени пользователя и паролей
              ResultSet rs = stmt.executeQuery(st); //выполнение запроса
              if(rs.next()==false) { //перемещение указателя вниз
                  System.out.print("No user"); //отобразить сообщение
                  JOptionPane.showMessageDialog(null,"Wrong Username/Password!"); 
 
              }
              else {
                  f.dispose();
                rs.beforeFirst(); //перемещение указателя вверх
                while(rs.next())
                {
                  String admin = rs.getString("admin"); //пользователь теперь админ
                  //System.out.println(admin);
                  String UID = rs.getString("uid"); //получение ID пользователя
                  if(admin.equals("1")) { //если значение 1
                      admin_menu(); //перенаправление в меню админа
                  }
                  else{
                      user_menu(UID); //перенаправление в меню пользователя
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
 
     
    f.add(F_pass); //добавление пароля
    f.add(login_but); //добавление кнопки в JFrame
    f.add(F_user); //добавление пользователя
    f.add(l1); //добавление метки1 для имени пользователя
    f.add(l2); //добавление метки2 для имени пароля
     
    f.setSize(400,180); //400 ширина и 100 высота
    f.setLayout(null); //использование no layout
    f.setVisible(true); //делает рамку видимой
    f.setLocationRelativeTo(null);
     
}
