<h1 align="center">✋ BEWARE ✋</h1>

## If you are a 42 Student, do not copy/paste this project, it will be considered cheating and you will be grated -42.

# 42 Wolfsburg Cursus 
## Minitalk
## Let's get to talking

# Contents

1. [Common Instructions](#common)
2. [Project Instructions](#project)
3. [Mandatory Part](#manda)
4. [Bonus Part](#bonus)

# <a name="common">Common Instructions</a>

| Common Instructions | ![Logo_Monolith_small](https://user-images.githubusercontent.com/120580537/209333599-dc44418d-8ee7-42b6-8a4a-7ff328778d87.png) |
| ----- | ----- |
* Your project must be written in C.
* Your project must be written in accordance with the Norm. <br>If you have bonus files/functions, they are included in the norm check and you will receive a 0 if there is a norm error inside.
* Your functions should not quit unexpectedly (segmentation fault, bus error, double free, etc) apart from undefined behaviors. <br>If this happens, your project will be considered non functional and will receive a 0 during the evaluation.
* All heap allocated memory space must be properly freed when necessary. No leaks will be tolerated.
* If the subject requires it, you must submit a Makefile which will compile your source files to the required output <br>with the flags **-Wall**, **-Wextra** and **-Werror**, use cc, and your Makefile must not relink.
* Your **Makefile** must at least contain the rules **$(NAME)**, **all**, **clean**, **fclean** and **re**.
* To turn in bonuses to your project, you must include a rule bonus to your Makefile, which will add all the various headers, <br>librairies or functions that are forbidden on the main part of the project. <br>Bonuses must be in a different file **_bonus.{c/h}** if the subject does not specify anything else. <br>Mandatory and bonus part evaluation is done separately.
* If your project allows you to use your **libft**, you must copy its sources and its associated **Makefile** in a **libft** folder with its associated Makefile. Your project’s **Makefile** must compile the library by using its **Makefile**, then compile the project.
* We encourage you to create test programs for your project even though this work **won’t have to be submitted and won’t be graded**. <br>It will give you a chance to easily test your work and your peers’ work. You will find those tests especially useful during your defence. <br>Indeed, during defence, you are free to use your tests and/or the tests of the peer you are evaluating.
* Submit your work to your assigned git repository. Only the work in the git repository will be graded. <br>If Deepthought is assigned to grade your work, it will be done after your peer-evaluations. <br>If an error happens in any section of your work during Deepthought’s grading, the evaluation will stop.

<p align="right">
 <a href="https://github.com/Cerberus2290/Minitalk#-beware-">back to top</a>
</p>

# <a name="project">Project Instructions</a>

* Name your executable files **client** and **server**.
* You have to turn in a **Makefile** which will compile your source files. It must not
relink.
* You can definitely use your **libft**.
* You have to handle errors thoroughly. In no way your program should quit unex- pectedly (segmentation fault, bus error, double free, and so forth).
* Your program mustn’t have ***memory leaks***.
* You can have **one global variable per program** (one for the client and one for
the server), but you will have to justify their use.
* In order to complete the mandatory part, you are allowed to use the following functions:
	* *write*
	* *ft_printf* and any equivalent *YOU* coded 
	* *signal*
	* *sigemptyset*
	* *sigaddset*
	* *sigaction*
	* *kill*
	* *getpid*
	* *malloc*
	* *free*
	* *pause*
	* *sleep*
	* *usleep*
	* *exit*

<p align="right">
 <a href="https://github.com/Cerberus2290/Minitalk#-beware-">back to top</a>
</p>

# <a name="manda">Mandatory Part</a>

You must create a communication program in the form of a client and a server.
* The server must be started first. After its launch, it has to print its PID.
* The client takes two parameters:
	* The server PID.
	* The string to send.
* The client must send the string passed as a parameter to the server.
Once the string has been received, the server must print it.
* The server has to display the string pretty quickly. Quickly means that if you think it takes too long, then it is probably too long.

## :lightbulb:</br>1 second for displaying 100 characters is way too much!</br>:lightbulb:

* Your server should be able to receive strings from several clients in a row without needing to restart.
* The communication between your client and your server has to be done **only** using UNIX signals.
* You can only use these two signals:</br> **SIGUSR1** and **SIGUSR2**.

## :information:_source:</br>Linux system does NOT queue signals when you already have pending signals of this type!  Bonus time?</br>:information_source:

<p align="right">
 <a href="https://github.com/Cerberus2290/Minitalk#-beware-">back to top</a>
</p>