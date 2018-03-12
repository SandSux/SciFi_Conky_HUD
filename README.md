## SciFi_Conky_HUD

Conky is a free system monitor tool for the X window system on Linux. It is able to monitor many system varaibles including CPU status, swap space, temperatures, disk usage, processes, network interfaces, battery status and a slew of others and then display the information on your desktop. It is also capable of displaying time, calendars, weather and more.

I cannot take full credit for this configuration. This beautiful config was written by a Hungarian developer; see "Contributors" section below for link to original file).

You can grab [the latest release from github](https://github.com/brndnmtthws/conky/releases/latest)

## Screenshot

![screen](https://user-images.githubusercontent.com/26425982/37259259-59794b1e-255a-11e8-9541-6cd5de5cd543.png)

## Documentation

The [GitHub Wiki](https://github.com/brndnmtthws/conky/wiki) is the central hub for all of Conky's documentation

## Installation

First and foremost we need to obtain the conky-all package

    sudo apt install conky-all

You can also visit GitHub's Conky Wiki for more [Installation options and information](https://github.com/brndnmtthws/conky/wiki/Installation)

Next, we need to install a few dependencies that did not come with our 'conky-all' package that we are going to need to get all these configs to run.

## Dependencies

    - Conky with LUA support and Cairo bindings.
    - Openweathermap API Key
    - jq
    - lm-sensors

**Install JQ**

JQ is a lightweight, command line JSON processor. Though it can be installed via `sudo apt install jq` we will need to to inform your system as to where to find jq first by adding the appropriate repository to our `sources.list` file. [More information](https://stedolan.github.io/jq/download/)

1. Open your `sources.list` file in your favorite text editor

  `sudo vim /etc/apt/sources.list`

2. Add the following line to the bottom of your `sources.list` file:

  `deb http://us.archive.ubuntu.com/ubuntu vivid main universe`

3. Then run:

  `sudo apt-get update`

4. Now you can issue your install command:

  `sudo apt-get install jq`

**Install & Configure lm-sensors**

In order to populate neccessary sensor data and achieve functionality with this script, we need to install and run lm-sensors

1. Install lm-sensors on Ubuntu or Debian Linux

  `sudo apt-get install lm-sensors`

2. Next, run `sudo sensors-detect` to configure sensors, then follow the prompts by responding "yes" to all. At the end of detection, lm-sensors will write out all detected sensors so that Conky can access the data. You can test the general function after configuration by running the command `sensors`

3. Optional: Install Conky Manager (GUI tool for those who prefer not to work in the command line)

    + Add the neccessary repository: `sudo add-apt-repository ppa:teejee2008/ppa`

    + Update: `sudo apt update`

    + Install Conky Manager: `sudo apt-get install conky-manager`

## Configuration

1. Acquire this repository: `git clone https://github.com/SandSux/SciFi_Conky_HUD.git` 

2. We need to relocate all of our conky files from this repo into a folder called `.conky` (The period indicates that this is a hidden file). 
    + Create a directory in your home folder so that all of the paths in the configuration files link the .lua, .png, etc.         files correctly 

    + Make directory:`cd && sudo mkdir ~/.conky`

    - Note: [CTRL + h] toggles hidden files from view

3. Openweathermap API - visit [OpenWeatherMap](https://openweathermap.org/api) to sign up for your API key

 ![openweathermap_screen](https://user-images.githubusercontent.com/26425982/37260065-30a48338-2565-11e8-98be-c9174c022775.png)
 
 + You will also need to find your City_ID [here](http://openweathermap.org/help/city_list.txt). (Use [CTRL+f] to search page) or use the included `city_list.txt` file (it's the same list as the linked one).
  
3. Included in this repo is a file named "conky_start" which we need to issue a `chmod` command to in order to make it executable 

      `chmod 755 conky_start`
      + Move `conky-start' into you home directory (your path) so you it can be executed directly from the command line.
      
4. Now conky can be started by issuing the command:
    
    `./conky_start`
    
5. Next, some values need to be changed in a couple configuration files so that they reflect your system hardware interfaces.
    - Pick your favorite text editor and open the net.rc file. 
    - In `net.rc` towards the bottom there are a few lines where you will enter your wireless adapter interface. You can run `ifconfig` to find out what your wireless adaper is called. It will likely be `wlan0` or something to the effect of `wlp**0`.
    
6. Open weather.rc and enter your openweathermap API key and your City_ID

7. Autorun at start:
   - Commands can be run at login by placing a launcher in the `~/.config/autostart` or by adding an entry to your `Startup Applications`gui
    
**Changes**
+ Compiled documentation and wrote README.md
+ Translated all Hungarian comments to English
+ Changed UTF-8 character encoding from Hungarian to en_US.UTF-8 on line 67 of weather.rc

## API Reference

For the `weather.rc` configuration, you are going to have to obtain an [API Key from OpenWeatherMap](https://openweathermap.org/api) in order to populate your weather data. For referrence, API stands for "Application Programming Interface." The API key is a code passed in by computer programs calling an application programming interface (API) to identify the calling program, its developer, or its user to the Web site. Simply, it is a way to pull specific data from a web service to be used in a third-party fashion.

## Contributors

I found the original script on the [KDE Store](https://store.kde.org/p/1197920). It was written by a Hungarian developer who did a spectacular job, though there was no documentation, README and all of the in-line information in the configs was written in Hungarian.


## License

MIT License:

    Permission is hereby granted, free of charge, to any person obtaining a copy of
    this software and associated documentation files (the "Software"), to deal in
    the Software without restriction, including without limitation the rights to
    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
    the Software, and to permit persons to whom the Software is furnished to do so,
    subject to the following conditions:   

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
    INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
    PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
    FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
    OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
    DEALINGS IN THE SOFTWARE.
    

