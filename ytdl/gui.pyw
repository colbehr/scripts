import tkinter
from tkinter import *

url = ""
root = Tk()
root.title("Download Gui")
root.iconbitmap(r"favicon.ico")
entry = Entry(root, width=30)
entry.pack(side=TOP,padx=10,pady=5)
root.lift ()
root.after(1, lambda: root.focus_force())
root.after(1, lambda: entry.focus_set())

def close(self = root):
    url = entry.get()
    getYoutube(url,mp4.get())
    
def getYoutube(url, mp4Bool):
    print("done " + url + str(mp4Bool))
    root.destroy()
    if(mp4Bool == False):
        print("Mp3")
        command = 'echo Mp3 && youtube-dl -o ~/Desktop/%(title)s.%(ext)s -f bestaudio --extract-audio  --audio-format mp3 '
        if("soundcloud" in str(url) or "bandcamp" in str(url)):
            command+= " --embed-thumbnail --add-metadata  "
        command += url
        command += "&& echo done"
    else:
        print("Mp4")
        command = 'echo Mp4 && youtube-dl -o ~/Desktop/%(title)s.%(ext)s -f bestvideo+bestaudio/best --recode-video mp4 '
        command += url
        command += "&& echo done"
    import os
    os.system(command)

    print(command)

mp4 = IntVar()
button = Button(root, text='Go',  command=close, width=30)
root.bind('<Return>', close)
button.pack()
checkbox = Checkbutton(root, text="Video", onvalue = 1, offvalue = 0, variable = mp4, width = 20).pack()
entry.focus_set()
root.mainloop()
