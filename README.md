# Searchit  
Terminal Based Search Customizer
[Why?](#what-is-searchit?)
### What Is Searchit?
Searchit is a software what allows to make customized internet search from your terminal.Currently It provides supports for 9 browsers and 24 websites.

### Why We Need Searchit?
If you are a linux user, you may find yourself working in terminal quit a lot of time (and it is very good). Now imagine how many times you had to search something you have to leave your terminal, open your browser, go to a specific site, search whatever you what to search. But with Searchit you dont even have to leave your terminal. Just type a command and searchit will automatically open your browser, go to the site and search it for you.
Some Examples:

```bash
# search "python" in google
searchit -ggl python
# search "apple" in duckduckgo
searchit -ddg apple
# search "eiffel tower" in wikipedia
searchit -wiki eiffel tower
# search "hunger games" in youtube
searchit -ytb hunger Games
# search "ip camera" in shodan
searchit -sdn ip camera
```
Also you can select a default search site. And then you can just type "searchit then your search query and searchit will automatically search it in your default search site

Example: If You selecte your default search site "google"

```Bash
searchit bangladesh
# it will automatically search "bangladesh" in google
searchit iron man
# it will automatically search "iron man" in google
```

Last but not least for **too much shortcut lovers** searchit also has two predefined commands for search anything in google and duckduckgo

```Bash
duckit burger
# it will search burger in duckduckgo
googleit pizza
# it will search pizza in google
```

In near future searchit will provide more **search options for individual sites** for better and more accurate search customization and also support for more and more websites.
Now you know why you need searchit

### How To Install Searchit?

There are 4 small steps to follow:
1. Download Searchit From Github
1. Go To Your Downloaded Directory
1. Open Terminal And Type
```Bash
./Searchit_Installer.sh
```
1. Then Just Simply Follow The Process
