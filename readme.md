# First Disciple: Grasscutter in Docker

![](./images/logo.png)

## Background Story

> TL;DR: As a gamer, I want to see if I can play platform-exclusive online-only games whenever & wherever I want, as long as my phone battery have not reach 0%.

I liked an online FPS looter-shooter before, and I spent a lot of time on it, even buying and upgrading my computer. Then I witnessed it becoming another ugly money-bragging monster just like every other online games did ("Die as a hero, or live long enough to be a villain", huh?). I have no choice but to leave the game before it become unbearable. Even worse, the company have deleted the campaign warfares and maps of first 3 years. As the game is online-only, I, as a player and cousumer, could no longer access the content even I have paid for them.

![](./images/)

A few months ago before initialization of this project, one of my friends asked if one can play a Windows-exclusive card game on phone (in this case, Android). While it is technically feasible, I did not try that solution as I did not hev the capacity to work on it.

I just read [an article](https://blog.kronis.dev/blog/stop-killing-games) about the recent "Stop Killing Games" movement. I noticed a project mentioned in the post, which allows players to play a certain [Gacha game](## "yes, you've guessed it, G****** I*****") locally without the fear of server getting shut down in the future.

## Aim of the project
The scope of this project is to create a Docker image (or a package) to run [Grasscutter](https://github.com/Grasscutters/Grasscutter) project and its launcher ([Cultivation](https://github.com/Grasscutters/Cultivation)) on any Linux system (including Android) without the need to connect main server in China.

This project also works as a Proof-of-concept (POC) of running Windows games on Android, just like Samsung's DeX mode.

![](./images/)

## Procedures
### 0 - Building a grasscutter in Windows VM 
(You can skip to Step 1 if you do not need this testing environment)
Here, I follow the official steps and build a local grasscutter first:
1. Set the environment:
    <table>
        <tr>
            <th>Component</th>
            <th>Product</th>
            <th>Version</th>
        </tr>
        <tr>
            <td>OS</td>
            <td>Windows</td>
            <td>10 Home</td>
        </tr>
        <tr>
            <td>Java</td>
            <td>OpenJDK</td>
            <td>17</td>
        </tr>
        <tr>
            <td>Database</td>
            <td>MongoDB</td>
            <td>Community Version 8</td>
        </tr>
    </table>
2. Install by GUI
3. Build a service-chain:<ol>
        <li>Database (MongoDB)
        <li>Application (Grasscutter)
        <li>Web (Cultivation) / other console
    </ol>

### 1 - Dockerized Grasscutter 
With the installation experience and knowing how to run that game, let's build a Docker version:
> Core Question in mind:<ol><li>Which step(s) could be automated in dockerfile?</li><li>Which component(s) could be in linux or service instead of Windows?</li><li>Which step(s) and conponent(s) could be replaced in shell script language?</li></ul>

<u>Steps</u>

1. 


### 2 - Packaging as a docker-compose.yaml / Docker image
> Core Question in mind: <ol><li></li></ul>

<b>TBC</b>

### 3 - Replicate the experience in Android
> Core Question in mind: <ol><li></li></ul>

<b>TBC</b>

## Conclusion
<b>TBC</b>

## Acknowledgements
- Game Server: [Grasscutter](https://github.com/Grasscutters/Grasscutter) 
- Game UI: [Cultivation](https://github.com/Grasscutters/Cultivation)
- All-in-one launcher: [Celestia Launcher](https://github.com/nullsora/CelestiaLauncher)<br>[It was archived and now read-only] 
- [Dockur/Windows](https://github.com/dockur/windows) - The base OS to play on
- [How to run Docker in Android](https://medium.com/@kumargaurav.pandey/docker-on-mobile-that-too-without-root-how-7b0848833c42)
- [GUI of Linux system in docker container](https://docs.linuxserver.io/images/docker-webtop)

## Disclaimer
<i>
    This project is not affiliated, sponsored, or endorsed by any corporation.
    This project is non-profit and only works for testing and developing purposes.
    <br>
    Use at your own risks. The author of this project shall not be liable to any loss in any form, nor legal issues raised.
</i>