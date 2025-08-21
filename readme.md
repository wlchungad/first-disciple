<style>
    a[href="#spoiler"] {
    text-decoration: none !important;
    cursor: default;
    background-color: #000000;
    display: inline-block;
    }
    a[href="#spoiler"]::after {
    content: attr(title);
    color: black;
    padding: 0 0.5em;
    }
    a[href="#spoiler"]:hover::after,
    a[href="#spoiler"]:active::after {
    cursor: auto;
    color: white;
    transition: color .5s ease-in-out;
    }
</style>

# First Disciple: Grasscutter in Docker

![](./images/logo.png)

## Background Story

I liked an online FPS looter-shooter before, and I witnessed it becoming another ugly money-bragging monster. I have no choice but to leave the game. The company have deleted the campaign warfares and maps of first 3 years. As the game is online-only, I, as a player and cousumer, could no longer access the content even I have paid for them.

![](./images/)

A few months ago before initialization of this project, one of my friends asked if one can play a Windows-exclusive card game on phone (in this case, Android). While it is technically feasible, I did not try that solution as I did not hev the capacity to work on it.

I just read [an article](https://blog.kronis.dev/blog/stop-killing-games?ref=dailydev) about the recent "Stop Killing Games" movement. I noticed a project mentioned in the post. That project allows players to play a certain Gacha game (<a href="#spoiler" title="yes, you've guessed it, G****** I*****"></a>) locally without the fear of server getting shut down in the future.

## Aim of the project
This project aims to create a Docker image (or a package) to run [Grasscutter](https://github.com/Grasscutters/Grasscutter) project and its launcher ([Cultivation](https://github.com/Grasscutters/Cultivation)) on any Linux system (including Android) without the need to connect main server in OnSea.
(<a href="#spoiler" title="FYR, OnSea means Shanghai in HellDiver 2"></a>)

This project also works as a Proof-of-concept (POC) of running Windows games on Android.

![](./images/)

## Steps
### 0 - Building a grasscutter in Windows VM
Here, I follow the official steps and build a local grasscutter:
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
3. Build a service-chain:<ol></ol>

### 1 - Dockerized Grasscutter 
> Core Question in mind: <ol><li>Which step(s) could be automated in dockerfile?</li><li>Which component(s) could be in linux or service instead of Windows?</li></ul>


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
- [Dockur/Windows](https://github.com/dockur/windows) - The base OS
- [How to run Docker in Android](https://medium.com/@kumargaurav.pandey/docker-on-mobile-that-too-without-root-how-7b0848833c42)
- [GUI of Linux system in docker container](https://docs.linuxserver.io/images/docker-webtop)

## Disclaimer
<i>
This project is not affiliated, sponsored, or endorsed by any corporation.
This project is merely for testing and developing purposes. 
Use at your own risks. The author of this project shall not be liable to any loss in any form, nor legal issues.
</i>