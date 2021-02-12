runs = arg[1]
shell.run("clear")
print("Idiot proofing, please hold")
os.sleep(51)
for i=1,runs do
    shell.run("clear")
    print("On run "..i.." of "..runs)
    redstone.setOutput("back",true)
    os.sleep(2)
    redstone.setOutput("back",false)
    os.sleep(51)
end
//https://imgur.com/a/rzDOf
