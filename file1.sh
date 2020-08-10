#!/bin/bash

echo
echo
echo "WELCOME TO ADDRESS BOOK"


create()
{
    echo "Enter address book name"
    read ab
#To check address book exist in current working directory   
  
    if [ -f $ab ]
    then
        echo "File is already exist"
    else
        touch $ab
        echo "Adress Book created"
    fi
}


view()
{
    echo -e "Enter address book name: \c"
    read ab
#To check address book exist in current working directory   
    if [ -f $ab ]
    then
        echo "first_name | last_name | email | mobile_no."
        cat $ab
    else
        echo "File not exist"
    fi
}

insert()
{
    echo -e "Enter address book name: \c"
    read ab
#To check address book exist in current working directory   
    if [ -f $ab ]
    then
        echo -e "Enter email: \c"
        read email

#check email exist or not in address book

    len=$( cat $ab | grep $email )
    length=${#len}
        if [ $length -gt 0 ]
        then 
            echo "Email exist "
        else
            echo -e "Enter first name last name and mobile no: \c"
            read fname lname mobile
       
           record=$(echo $fname $lname $email $mobile)
           echo $record >> $ab
           echo "Record inserted....! "
        fi
        else
            echo "File not exist "
    fi
}




delete()
{
    echo -e "Enter address book name: \c"
    read ab
#To check address book exist in current working directory   
    if [ -f $ab ]
    then
        echo -e "Enter email \c"
        read email

#check email exist or not in address book

    len=$(cat $ab | grep $email )
    length=${#len}
    if [ $length -gt 0 ]
    then 
       
        old=$(cat $ab | grep $email)
        sed -i s/"$old"//g $ab
        echo "Record deleted successfully ...!"
    else
        echo "Email not exist "
    fi
    else
        echo "File not exist "
    fi
}



modify()
{
    echo -e "Enter address book name: \c"
    read ab
#To check address book exist in current working directory   
if [ -f $ab ]
then
    echo -e "Enter email: \c"
    read email

#check email exist or not in address book
    len=$(cat $ab | grep $email )
    length=${#len}
    if [ $length -gt 0 ]
    then 
        echo -e "Enter data to modify first name last name and mobile: \c"
        read fname lname mobile
        new=$(echo "$fname $lname $email $mobile" )
        old=$( cat $ab | grep $email )
        echo "old record: $old"
        echo "New record: $new"
        sed -i s/"$old"/"$new"/g $ab
        echo "Record modified....!"
    else
        echo "Email not exist "
    fi
    else
        echo "File not exist"
fi
}




i=1
while [ $i -gt 0 ]
do
    echo
    echo
    echo "******Menu*******"
    echo "1.Create"
    echo "2.View"
    echo "3.Insert"
    echo "4.Delete"
    echo "5.Modify"
    echo "6.Exit"



    echo -e "Enter choice: \c"
    read choice
     

    case $choice in
         1) create ;;
         2) view ;;
         3) insert ;;
         4) delete ;;
         5) modify ;;
         6) exit ;;
         *) echo "Wrong choice " ;;
    esac
done


# # ......... OUTPUT..........

# mahesh@mahesh-HP-Laptop-15-bs1xx:~$ chmod +x file1.sh
# mahesh@mahesh-HP-Laptop-15-bs1xx:~$ ls -l file1.sh
# -rwxr-xr-x 1 mahesh mahesh 3028 Aug 10 21:49 file1.sh
# mahesh@mahesh-HP-Laptop-15-bs1xx:~$ ./file1.sh


# WELCOME TO ADDRESS BOOK


# ******Menu*******
# 1.Create
# 2.View
# 3.Insert
# 4.Delete
# 5.Modify
# 6.Exit
# Enter choice: 1
# Enter address book name
# test.txt
# Adress Book created


# ******Menu*******
# 1.Create
# 2.View
# 3.Insert
# 4.Delete
# 5.Modify
# 6.Exit
# Enter choice: 3
# Enter address book name: test.txt
# Enter email: example@gmail.com
# Enter first name last name and mobile no: abc def 9865742345
# Record inserted....! 


# ******Menu*******
# 1.Create
# 2.View
# 3.Insert
# 4.Delete
# 5.Modify
# 6.Exit
# Enter choice: 3
# Enter address book name: file1.txt
# File not exist 


# ******Menu*******
# 1.Create
# 2.View
# 3.Insert
# 4.Delete
# 5.Modify
# 6.Exit
# Enter choice: 3 
# Enter address book name: test.txt
# Enter email: example@gmail.com
# Email exist 


# ******Menu*******
# 1.Create
# 2.View
# 3.Insert
# 4.Delete
# 5.Modify
# 6.Exit
# Enter choice: 3
# Enter address book name: test.txt
# Enter email: vodafoneindia@gmail.com
# Enter first name last name and mobile no: aditya birla 8753546881
# Record inserted....! 


# ******Menu*******
# 1.Create
# 2.View
# 3.Insert
# 4.Delete
# 5.Modify
# 6.Exit
# Enter choice: 2
# Enter address book name: test.txt
# first_name | last_name | email | mobile_no.
# abc def example@gmail.com 9865742345
# aditya birla vodafoneindia@gmail.com 8753546881


# ******Menu*******
# 1.Create
# 2.View
# 3.Insert
# 4.Delete
# 5.Modify
# 6.Exit
# Enter choice: 5
# Enter address book name: test.txt
# Enter email: example@gmail.com
# Enter data to modify first name last name and mobile: john smith +12354612345
# old record: abc def example@gmail.com 9865742345
# New record: john smith example@gmail.com +12354612345
# Record modified....!


# ******Menu*******
# 1.Create
# 2.View
# 3.Insert
# 4.Delete
# 5.Modify
# 6.Exit
# Enter choice: 2
# Enter address book name: test.txt
# first_name | last_name | email | mobile_no.
# john smith example@gmail.com +12354612345
# aditya birla vodafoneindia@gmail.com 8753546881


# ******Menu*******
# 1.Create
# 2.View
# 3.Insert
# 4.Delete
# 5.Modify
# 6.Exit
# Enter choice: 4
# Enter address book name: test.txt
# Enter email vodafoneindia@gmail.com
# Record deleted successfully ...!


# ******Menu*******
# 1.Create
# 2.View
# 3.Insert
# 4.Delete
# 5.Modify
# 6.Exit
# Enter choice: 2
# Enter address book name: test.txt
# first_name | last_name | email | mobile_no.
# john smith example@gmail.com +12354612345



# ******Menu*******
# 1.Create
# 2.View
# 3.Insert
# 4.Delete
# 5.Modify
# 6.Exit
# Enter choice: 6
# mahesh@mahesh-HP-Laptop-15-bs1xx:~$ 