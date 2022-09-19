### Bat language

Bat is a superset of the Windows batch language.
In this repository, you can find how to use the basic features of bat.
For example, you can find how to use the `for` loop, the `if` statement and how to add comments.

---

### Adding comments

In bat language, you can add comments by using the `rem` keyword.
For example, you can add a comment like this:

    rem This is a comment

---

### Variables

As you know, variables are used to store data. It is the same for bat.
You can declare a variable by using the `set` keyword.
For example, you can declare a variable like this:

    set my_variable=Hello World!

You can also use the `set` keyword to change the value of a variable.
For example, you can change the value of the `my_variable` variable like this:

    set my_variable= hey!

---

### The `echo` command

The `echo` command is used to print text to the console. If you worked with other programming languages, such as Python, you should know what the `print` function does.
For example, you can print the value of the `my_variable` variable like this:

    echo %my_variable%

> why is there a `%` before the variable name?

The `%` is used to tell bat that the variable is a variable. If you don't use the `%`, bat will print the variable name instead of the variable value.

---

### The `for` loop

The `for` loop is used to repeat a block of code a specific number of times.
For example, you can print the numbers from 1 to 10 like this:

    for /l %%i in (1,1,10) do echo %%i

`/l` is used to specify that the loop is a numeric loop.
`%%i` is the variable that will be used in the loop.
`(1,1,10)` is the range of the loop. The first number is the starting number, the second number is the increment and the third number is the ending number.
`echo %%i` is the code that will be executed in the loop. As I mentioned below, `echo` is used to print text to the console.

---

### The `if` statement

The `if` statement is used to execute a block of code if a condition is true.
For example, you can print `Hello World!` if the value of the `my_variable` variable is `Hello World!` like this:

    if "%my_variable%"=="Hello World!" echo Hello World!

`%my_variable%` is the variable that will be checked.
`==` is the operator that will be used to check if the variable is equal to `Hello World!`.

### Getting ip address

You can get your ip address with the `ipconfig` command.
For example, you can get your ip address like this:

    ipconfig | findstr /r /c:"IPv4 Address.*:"

`ipconfig` is the command that will be used to get the ip address.
Of course, you can use the `ipconfig` command without the `| findstr /r /c:"IPv4 Address.*:"` part, but it will print a lot of useless information.

`|` is used to pipe the output of the `ipconfig` command to the `findstr` command.
`findstr` is used to find a specific string in the output of the previous command.
`/r` is used to make the search case insensitive.
`/c:"IPv4 Address.*:"` is the string that will be searched for.
Also, there is a space before the `:`. If you don't add the space, it will print the ip address with the `:` at the end.
To be honest, I don't use this command very often. I'll talk about a better way to get the ip address later.

---

### The `pause` command

The `pause` command is used to pause the execution of the script until the user presses a key.
For example, you can pause the execution of the script like this:

    pause

I use this command a lot when I'm testing my scripts. You know that when you run a script, the console closes immediately. If you want to see the output of the script, you have to use the `pause` command.

---

### The `cls` command

The `cls` command is used to clear the console.
For example, you can clear the console like this:

    cls

---

### The `start` command

The `start` command is used to open a file or a website.
For example, you can open a website like this:

    start https://github.com

---

### The `setlocal` and `endlocal` commands

The `setlocal` and `endlocal` commands are used to create a local scope.
If you declare a variable inside a local scope, it will be deleted when the local scope ends. Or if you familiar with other programming languages, such as Java, Javascript it is the same as the `try` and `finally` blocks. If you declare a variable inside a `try` block, it will be deleted when the `finally` block ends.
For example, you can create a local scope like this:

    setlocal
    set my_variable=Hello World!
    echo %my_variable%
    endlocal

---

### Getting ip address and writing it to a file

Before to talk about this, I want to talk about the `>` operator.
The `>` operator is used to redirect the output of a command to a file.
For example, you can redirect the output of the `ipconfig` command to a file like this:

    ipconfig > ipText.txt

`ipText.txt` is the file that will be created. If the file already exists, it will be overwritten.

Let's get started with the script.

```bat
@echo off
setlocal
set "ip=
for /f "tokens=1,2 delims=:" %%a in ('ipconfig ^| findstr "IPv4"') do set "ip=%%b"
if "%ip%"=="" (
    echo No IP address found.
) else (
    echo IP address is %ip%.
)

echo Hi %username%! your IP address is %ip%. You shouldn't open random file! > ipText.txt
start  ipText.txt

```

What does this script do exactly?
Let's talk about it step by step.
First, we disable command echoing by using the `@echo off` command.
Then, we enable local variables by using the `setlocal` command.
Then, we declare a variable named `ip` and set it to an empty string.
Then, we use the `for` loop to get the ip address.
Then, we check if the value of the `ip` variable is an empty string.
If it is, we print `No IP address found.`.
If it isn't, we print `IP address is %ip%.`.
Then, we print `Hi %username%! your IP address is %ip%. You shouldn't open random file!` to the `ipText.txt` file.
Then, we open the `ipText.txt` file.

---

Thank you for reading this tutorial. I hope you learned something new. If you have any questions, feel free to ask them in the issues section. If you want to contribute to this tutorial, feel free to open a pull request.

I'll talk about the data types in the next tutorial.
