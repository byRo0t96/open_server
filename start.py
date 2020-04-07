from tkinter import *
from subprocess import call
import os

os.system("chmod u+x functions.sh")

root = Tk()

#start php
def startphp():
    rc = call("./functions.sh startphp", shell=True)
#stop php
def stopphp():
    rc = call("./functions.sh stopphp", shell=True)
#open php
def openphp():
    rc = call("./functions.sh openphp", shell=True)

#start ln
def startln():
    rc = call("./functions.sh startln", shell=True)
#stop ln
def stopln():
    rc = call("./functions.sh stopln", shell=True)
#open ln
def openln():
    rc = call("./functions.sh openln", shell=True)

#start ngrok
def startngrok():
    rc = call("./functions.sh startngrok", shell=True)
#stop ngrok
def stopngrok():
    rc = call("./functions.sh stopngrok", shell=True)
#open ngrok
def openngrok():
    rc = call("./functions.sh openngrok", shell=True)

#Exit
def Exit():
    rc = call("./functions.sh Exit", shell=True)
    quit()

label = Label(root, text="Cpanel",font = ('',20),pady=5,padx=5) # Create a text label
label.grid(row=1,column=1)

startphp = Button(root, text ="Start PHP",bd = 1 ,font = ('',15),padx=5,pady=5,command=startphp, height = 1, width = 8)
startphp.grid(row=2,column=1)
openphp = Button(root, text ="Open PHP",bd = 1 ,font = ('',15),padx=5,pady=5,command=openphp, height = 1, width = 8)
openphp.grid(row=2,column=2)
stopphp = Button(root, text ="Stop PHP",bd = 1 ,font = ('',15),padx=5,pady=5,command=stopphp, height = 1, width = 8)
stopphp.grid(row=2,column=3)

startln = Button(root, text ="Start ln",bd = 1 ,font = ('',15),padx=5,pady=5,command=startln, height = 1, width = 8)
startln.grid(row=3,column=1)
openln = Button(root, text ="Open ln",bd = 1 ,font = ('',15),padx=5,pady=5,command=openln, height = 1, width = 8)
openln.grid(row=3,column=2)
stopln = Button(root, text ="Stop ln",bd = 1 ,font = ('',15),padx=5,pady=5,command=stopln, height = 1, width = 8)
stopln.grid(row=3,column=3)

startln = Button(root, text ="Start ngrok",bd = 1 ,font = ('',15),padx=5,pady=5,command=startngrok, height = 1, width = 8)
startln.grid(row=4,column=1)
openln = Button(root, text ="Open ngrok",bd = 1 ,font = ('',15),padx=5,pady=5,command=openngrok, height = 1, width = 8)
openln.grid(row=4,column=2)
stopln = Button(root, text ="Stop ngrok",bd = 1 ,font = ('',15),padx=5,pady=5,command=stopngrok, height = 1, width = 8)
stopln.grid(row=4,column=3)

Exit = Button(root, text ="Exit",bd = 1 ,font = ('',15),padx=5,pady=5,command=Exit, height = 1, width = 8)
Exit.grid(row=5,column=2)




root.title("Open Server")
root.mainloop()

