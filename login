public static void login() {
     
    JFrame f=new JFrame("Login");//создание экземпляра JFrame
    JLabel l1,l2;  
    l1=new JLabel("Username");  //cоздание метки Username
    l1.setBounds(30,15, 100,30); //ось x, ось y, ширина, высота 
     
    l2=new JLabel("Password");  //cоздание меткиl Password
    l2.setBounds(30,50, 100,30);    
     
    JTextField F_user = new JTextField(); //создание текстового поля для пользователя
    F_user.setBounds(110, 15, 200, 30);
         
    JPasswordField F_pass=new JPasswordField(); //создание текстового поля для пароля
    F_pass.setBounds(110, 50, 200, 30);
       
    JButton login_but=new JButton("Login");//создание экземпляра JButton для Login Button
    login_but.setBounds(130,90,80,25);//размеры кнопки
    login_but.addActionListener(new ActionListener() {
