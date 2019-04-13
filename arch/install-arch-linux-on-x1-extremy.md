# DISCLAIMER
**I am not responsible for any damages, loss of data, system corruption, or any
other mishap you may somehow cause by following this guide.**

This is mainly a step-by-step reminder/log for myself of how I installed Arch on
my laptop. I am putting this out there in case it is useful for someone else, it
is **not** intended to be an official guide. As a result, you may find that this
guide is very tedious or lists a lot of unnecessary/intuitive steps or just
straight up does things in a way that is considered bad practice. Apart from the
latter, this is intentional, as I did not find these steps intuitive at all when
I was doing this, and as such I chose to list _everything_ that I did in case
someone else would need/like a similar level of guidance.

I will try, but I cannot promise that I will keep this guide up-to-date with the
the Arch Wiki. **If you are reading this a couple of months down the line and I
have not updated it in a while, you ~~might~~ will want to check with/refer to
the Arch Wiki either completely or at least in parallel to this guide as
settings/commands/recommendations might have changed.**


# My Setup (at the time of writing)
- **BIOS: 1.17**
- OS: Windows 10 1809 64-bit
- RAM: 16GB
- DISK 1: 1TB NVMe SSD with Windows installed on it
- DISK 2: 512GB NVMe SSD, empty and unformatted


# Credit (and suggested reading if you want to _fully_ understand _everything_)
## rEFInd
- [https://www.rodsbooks.com/refind/index.html][rEFInd_index]
- [https://www.rodsbooks.com/refind/getting.html][rEFInd_get]
- [https://www.rodsbooks.com/refind/installing.html#windows][rEFInd_windows]

## The Arch Wiki
- [https://wiki.archlinux.org/index.php/Installation_guide][AW_install]
- [https://wiki.archlinux.org/index.php/Wireless_network_configuration][AW_wnc]
- [https://wiki.archlinux.org/index.php/Fdisk][AW_fdisk]
- [https://wiki.archlinux.org/index.php/Partitioning][AW_parti]
- [https://wiki.archlinux.org/index.php/EFI_system_partition][AW_efisp]
- [https://wiki.archlinux.org/index.php/Fstab][AW_fstab]
- [https://wiki.archlinux.org/index.php/File_systems#Types_of_file_systems][AW_mkfscmds]
- [https://wiki.archlinux.org/index.php/NetworkManager][AW_nm]
- [https://wiki.archlinux.org/index.php/Simple_stateful_firewall][AW_firewall]
- [https://wiki.archlinux.org/index.php/Users_and_groups#User_management][AW_users]
- [https://wiki.archlinux.org/index.php/Sudo][AW_sudo]
- [https://wiki.archlinux.org/index.php/Bumblebee#Installation][AW_bumblebee]
- [https://wiki.archlinux.org/index.php/Xorg][AW_xorg]
- [https://wiki.archlinux.org/index.php/Desktop_environment][AW_de]
- [https://wiki.archlinux.org/index.php/Cinnamon][AW_cinnamon]
- [https://wiki.archlinux.org/index.php/Gnome][AW_gnome]
- [https://wiki.archlinux.org/index.php/Deepin_Desktop_Environment][AW_deepin]
- [https://wiki.archlinux.org/index.php/Display_manager][AW_dm]
- [https://wiki.archlinux.org/index.php/LightDM][AW_lightdm]
- [https://wiki.archlinux.org/index.php/Window_manager][AW_wm]
- [https://wiki.archlinux.org/index.php/I3][AW_i3]
- [https://wiki.archlinux.org/index.php/List_of_applications/Security#Screen_lockers][AW_scrlock]
- [https://wiki.archlinux.org/index.php/Xorg/Keyboard_configuration#Using_localectl][AW_keyblocalectl]
- [https://wiki.archlinux.org/index.php/List_of_applications#Terminal_emulators][AW_termem]
- [https://wiki.archlinux.org/index.php/Screen_capture][AW_scrcapture]
- [https://wiki.archlinux.org/index.php/feh][AW_feh]
- [https://wiki.archlinux.org/index.php/List_of_applications][AW_applist]
- [https://wiki.archlinux.org/index.php/Firefox][AW_firefox]
- [https://wiki.archlinux.org/index.php/LibreOffice][AW_libre]
- [https://wiki.archlinux.org/index.php/Atom][AW_atom]
- [https://wiki.archlinux.org/index.php/Vim][AW_vim]
- [https://wiki.archlinux.org/index.php/System_time][AW_systime]
- [https://wiki.archlinux.org/index.php/Systemd-timesyncd][AW_timesyncd]
- [https://wiki.archlinux.org/index.php/Arch_User_Repository][AW_aur]
- [https://wiki.archlinux.org/index.php/Git][AW_git]
- [https://wiki.archlinux.org/index.php/Chromium][AW_chromium]
- [https://wiki.archlinux.org/index.php/Thunderbird][AW_thunderbird]

## Misc
- [https://itsfoss.com/install-arch-linux/][itsfoss_arch] (the "Partitioning the
  disks" section)
- [https://superuser.com/questions/1143788/arch-linux-ethernet-interface-always-down-after-boot][superuser_archinternet]
- [https://www.ntppool.org/en/][ntppool]
- [https://aur.archlinux.org/packages/][AUR_packages]


# Preparation
## BIOS
**MAKE SURE YOUR BIOS IS VERSION 1.17 OR GREATER. Failure to do so may result in
the BIOS setting changes BRICKING YOUR LAPTOP**
- Set the `Security -> Secure Boot -> Secure Boot` setting to "Disabled".
- Set the `Configs -> Display -> Graphics Device` setting to "Discrete".
- Set the `Configs -> Thunderbolt (TM) 3 -> Thunderbolt BIOS Assist Mode`
  setting to "Enabled". (Not required if you are using kernel 4.20 or newer.
  \[Thanks to u/melentye for pointing this out\]).

## Hardware
- You will need a USB stick of at least 1GB in size.
  NOTE: All data on this drive will be lost, so make sure it doesn't contain
  anything important or that you have backed up the contents.
- You will need a **wired** internet connection to the laptop. (EDIT: not
  the case: wireless network _can_ be set up from the live image. I will
  put my **guess** at how to, further down in the initial steps of the
  guide. \[Thanks to u/rootsvelt for pointing this out\]).

## Software
- I have heard from the technicians at my university, that GRUB can get
  corrupted by Windows updates, so I will not be using GRUB. Instead, I have a
  friend who has been dual-booting Arch and Windows 10 for some years now and
  who has never had a problem with using rEFInd. So that is what I will be
  installing here.
- Download and install rEFInd ([refer to this](#rEFInd)).
  - This can cause a minor heart attack the first time doing this: after
    following the instructions and rebooting, it took a while for my laptop to
    boot back up, to load rEFInd, and to launch Windows. This was quite
    stressful, but no damage was done. The laptop and Windows started
    successfully.
- Download the latest [Arch ISO](https://www.archlinux.org/download/).
- Download [Rufus](https://rufus.ie/).

## Setup
1. Plug in your USB drive.
2. Open Rufus and make sure your drive is selected under "Device".
3. Under "Boot selection", click "Select" and find and select the Arch ISO.
4. Leave everything else as default, making sure `FAT32` is selected as
   the "File system", under the "Format Options" section.
5. Click "Start" to write the ISO to your USB stick.
6. When it is done, restart your computer and boot from the USB stick.


# Installation
## Starting the installation image
- Select "Arch Linux archiso x86_64 UEFI USB"
  (this might take a while to start, it took 21 seconds when I did it)

## Keyboard Layout
- Keyboard layouts can be listed by running
  ```
  ls /usr/share/kbd/keymaps/**/*.map.gz
  ```
- If you are looking for a specific layout or layout group, use `grep`:
  - e.g. for Danish layouts run
    ```
    ls /usr/share/kbd/keymaps/**/*.map.gz | grep "da"
    ```
  - e.g. for Dvorak layouts run
    ```
    ls /usr/share/kbd/keymaps/**/*.map.gz | grep "dvorak"
    ```
- Modify the keyboard layout if need be, I am used to a Danish Dvorak keyboard,
  so I typed
  ```
  loadkeys no-dvorak
  ```
  (Technically, this is a Norwegian Dvorak, but they are pretty much identical).

[source:
  [Arch Installation Guide](AW_install)
]

## Checking Things
- Check that your BIOS is set to UEFI boot mode by running
  ```
  ls /sys/firmware/efi/efivars
  ```
  If the file or directory does not exist, your BIOS is not set to UEFI boot
  mode. Reboot, change your boot settings to UEFI, and start from
  [the beginning of this guide](#installation).
- Check that you are connected to the internet by running
  ```
  ping -c 3 archlinux.org
  ```
  There should be no pacage loss. If there is, check your internet connection
  (e.g. cable plugged in, router working, etc.) and try again.
- Synchronise your system clock by running
  ```
  timedatectl set-ntp true
  ```

[source:
  [Arch Installation Guide](AW_install)
]

## Partitioning
- Run
  ```
  fdisk -l
  ```
  to list the available block devices/drives. Note the size and path of the one
  you wish to install Arch on, e.g. for me it was `/dev/nvme0n1`, which will be
  the path I use for the rest of this section.
- Start `fdisk` on the desired drive by running
  ```
  fdisk /dev/nvme0n1
  ```
  **Make sure that this corresponds to your empty drive and not your Windows
  drive. Otherwise your Windows installation will be lost.**
- NOTE: If you at any point mess up or regret a choice made, simply run the `q`
  command at the next possible point. This will quit without writing to the
  disk.

[sources:
  [Arch Installation Guide](AW_install),
  the "Partitioning the disks" section of [this page](itsfoss_arch)
]
### Root Partition
- Run the `g` command to create a new GPT.
- Run the `n` command to start creating a new partition.
- Accept the default number (press `Enter`).
- Accept the default start sector (press `Enter`).
- Indicate the size, e.g. I chose to allocate 50GiB for the root partition:
  `+50G`. (Probably excessive, I know).

[source:
  the "Partitioning the disks" section of [this page](itsfoss_arch)
]
### Swap Partition
- NOTE: This step is optional as far as I understand.
- Run the `n` command to start creating a new partition.
- Accept the default number.
- Accept the default start section.
- Indicate the size, e.g. I chose to allocate 24GiB i.e. 1.5 times the amount of
  RAM I had: `+24G`

[source:
  the "Partitioning the disks" section of [this page](itsfoss_arch)
]
### Home Partition
- Run the `n` command to start creating a new partition.
- Accept the default number.
- Accept the default start section.
- Accept the default end section, i.e. the remainder of the drive (unless you do
  not want this, in which case, indicate a size).

[source:
  the "Partitioning the disks" section of [this page](itsfoss_arch)
]
### Write and check the changes
- Write the changes to the disk by running the `w` command. This should take you
  back to the main command prompt.
- Check that the changes were written by running `fdisk -l`. You should see your
  partitions listed as
  ```
  /dev/nvme0n1p1
  /dev/nvme0n1p2
  /dev/nvme0n1p3
  ```
  with their sizes next to them.

[sources:
  [Arch Installation Guide](AW_install),
  the "Partitioning the disks" section of [this page](itsfoss_arch)
]

## Formatting the Partitions
### Root Partition
- I will be using the EXT4 file system for my root partition, so I format the
  root partition by running
  ```
  mkfs.ext4 /dev/nvme0n1p1
  ```
  If you want to use a different file system, check
  [this Arch Wiki page](AW_mkfscmds) for the appropriate `mkfs` command.

[sources:
  [Arch Installation Guide](AW_install),
  the "Partitioning the disks" section of [this page](itsfoss_arch),
  the "Types of file systems" section of [this page](AW_mkfscmds)
]
### Swap Partition
- If you made a swap partition, format it by running
  ```
  mkswap /dev/nvme0n1p2
  ```
[source:
  [Arch Installation Guide](AW_install)
]
### Home Partition
- Again, I will be using the EXT4 file system for my root partition, so I run
  ```
  mkfs.ext4 /dev/nvme0n1p3
  ```
  If you want to use a different file system, check
  [this Arch Wiki page](AW_mkfscmds) for the appropriate `mkfs` command.

[sources:
  [Arch Installation Guide](AW_install),
  the "Partitioning the disks" section of [this page](itsfoss_arch),
  the "Types of file systems" section of [this page](AW_mkfscmds)
]

## Mounting the Partitions
- Mount the root partition by running
  ```
  mount /dev/nvme0n1p1 /mnt
  ```
- Mount the swap partition by running
  ```
  swapon /dev/nvme0n1p2
  ```
- Create the mount point for the home partition by running
  ```
  mkdir /mnt/home
  ```
- Create the mount point for the EFI partition (where you installed rEFInd) by
  running
  ```
  mkdir /mnt/efi
  ```
- Mount the home partition by running
  ```
  mount /dev/nvme0n1p3 /mnt/home
  ```
- If you have not noted the path of the EFI partition already, run
  ```
  fdisk -l
  ```
  and do so. For me it was
  ```
  /dev/nvme1n1p1
  ```
  NOTE: This one _should_ be from your Windows drive. That is where you
  installed rEFInd after all.
- Mount the EFI partition by running
  ```
  mount /dev/nvme1n1p1 /mnt/efi
  ```
- Check that everything is mounted by running
  ```
  lsblk
  ```
  The mount points should now be listed next to their partitions.

[source:
  [Arch Installation Guide](AW_install)
]

## Pacman Mirrors
- Use your favourite text editor (nano, vi, ...) to edit the
  `/etc/pacman.d/mirrorlist` file. The mirrors which are the closest to you
  should be at the top and the mirrors which you do not need can be deleted. If
  you are travelling between multiple countries, like I do, I think having
  multiple countries on the list might be beneficial. I do not know for certain
  though.
- Save the file when you are done editing the mirror list, and exit the text
  editor.

[source:
  [Arch Installation Guide](AW_install)
]

## Base Install
- IF you will not be building/developing/writing packages for Arch and/or will
  not be installing packages from the Arch User Repository (more on this later),
  then you will not need `base-devel`. Simply run:
  ```
  pacstrap /mnt base
  ```
  OTHERWISE, if you _will_ be doing some of those things, then you will need
  `base-devel`, so run:
  ```
  pacstrap /mnt base base-devel
  ```
  The install may take a while.
- NOTE: It is not too serious if you later find out you do need `base-devel`, as
  it can be installed later using `pacman` (more on this later).

[source:
  [Arch Installation Guide](AW_install)
]

## Automatic Mounting (fstab)
- To create the `fstab` file which describes where to mount what when booting,
  run
  ```
  genfstab -U /mnt >> /mnt/etc/fstab
  ```
- check that the UUIDs of the partitions match the ones in the generated `fstab`
  file by first running either `fstab -f` or `blkid` (which will give you the
  partitions, their UUIDs, and their mount points) and comparing the output with
  the output of running `cat /mnt/etc/fstab`. Correct any errors there might be
  (there were none for me) using a text editor.

[source:
  [Arch Installation Guide](AW_install)
]

## Accessing
- To access the newly installed Arch system, run `arch-chroot /mnt`

[source:
  [Arch Installation Guide](AW_install)
]


# Initial Setup
## Time
- Set your time zone by running
  ```
  ln -sf /usr/share/zoneinfo/<Region>/<City> /etc/localtime
  ```
  where `<Region>` and `<City>` are replaced by your region and city.
  - NOTE: When typing this command, hitting the TAB key twice after typing
    `ln -sf /usr/share/zoneinfo/` will give you a list of all the possible
    values. Look over these, find your relevant one (e.g. `Europe/`) and type it
    in. Then hit TAB twice again to get a list of cities. Pick the closest/most
    relevant one and type it in. Then type out the rest of the command and run
    it, it should look something like when it is ready to be run:
    ```
    ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime
    ```
- Set the system clock using the hardware clock by running
  ```
  hwclock --systohc
  ```

[source:
  [Arch Installation Guide](AW_install)
]

## Localisation (Date/Time/Currency Display)
- Using a text editor, open `/etc/locale.gen`.
- Uncomment any localisations you might need (i.e. remove the `#` before them).
- Save the file and exit the text editor.
- Generate the localisations by running
  ```
  locale-gen
  ```
- Use a text editor to set `LANG` variable to the desired locale by editing the
  `/etc/locale.conf` file. E.g. for British English, `/etc/locale.conf` should
  say `LANG=en_GB.UTF8`.
- If you changed the keyboard layout, make the change permanent by using a text
  editor to edit the `/etc/vconsole.conf` file. For me, I made it contain the
  line `KEYMAP=no-dvorak` to make the Norwegian/Danish Dvorak keyboard layout
  permanent.

[source:
  [Arch Installation Guide](AW_install)
]

## Hostname and Localhost
### Hostname
- Use a text editor to edit/create the `/etc/hostname` file.
- Have it contain your hostname, e.g. `my-thinkpad`.
- Save and exit the text editor.

[source:
  [Arch Installation Guide](AW_install)
]

### Localhost
- Use a text editor to edit/create the `/etc/hosts` file.
- Have it contain the following three lines:
  ```
  127.0.0.1     localhost
  ::1           localhost
  127.0.1.1	    <hostname>.localdomain	<hostname>
  ```
  where `<hostname>` is replaced by the hostname you wrote in `/etc/hostname`.

[source:
  [Arch Installation Guide](AW_install)
]

## Root/Sudo Password
- Run
  ```
  passwd
  ```
  to set up the root password.

[source:
  [Arch Installation Guide](AW_install)
]

## Finishing Up
- Run
  ```
  exit
  ```
  to quit the `arch-chroot`.
- Run
  ```
  reboot
  ```
  to reboot, and then wait for the system to power off and start rebooting
  before removing the USB.
- You sould now see an Arch logo when rEFInd starts. The username is `root`, and
  the password is what you set it to using the `passwd` command.

[source:
  [Arch Installation Guide](AW_install)
]


# Post Install
## Networks
I couldn't easily find the following information on the "Network configuration"
page. Eventually, [this superuser answer](superuser_archinternet) helped me out:
- When you reboot, you will have no network connection, wired or wireless. This
  is apparently because the network service is not running. Start it by running
  ```
  systemctl start dhcpcd.service
  ```
  You should now be connected to the wired connection (test by running
  ```
  ping -c 3 archlinux.org
  ```
  ). It might output some text. Simply press `Ctrl`+`C` to get a normal terminal
  prompt.
- If you, like me, do not want to manually configure every new network you need
  to connect to but rather want a "plug-and-play" solution, we will be
  installing NetworkManager which conflicts with `dhcpcd`, so you should not
  enable `dhcpcd`. Instead, skip to the next bullet point.  
  However, if you are fine with `systemctl` and its network services, then
  enable the service to start on boot by running
  ```
  systemctl enable dhcpcd.service
  ```
  Then, skip to [here](#firewall).
- Now that you have the connection established/restored, download NetworkManager
  by running
  ```
  pacman -S networkmanager
  ```
  Installing does not start the service, so there is no need to worry
  about conflicts with `dhcpcd`.
- Stop `dhcpcd` by running
  ```
  systemctl stop dhcpcd.service
  ```
  It is most likely excessive, but I then rebooted (by running `reboot`) just to
  be 110% sure it was off.
- Enable NetworkManager on boot by running
  ```
  systemctl enable NetworkManager.service
  ```
- Start NetworkManager by running
  ```
  systemctl start NetworkManager.service
  ```
  Again, if there is some text, simply press `Ctrl`+`C` to get a normal command
  line.
- You should now be connected to the wired connection again. Again, you can
  check this by running
  ```
  ping -c 3 archlinux.org
  ```
- If you want to connect to a wireless network run
  ```
  nmcli device wifi list
  ```
  to list all detected wifi networks.
- Then run
  ```
  nmcli device wifi connect <SSID> password <password>
  ```
  to connect to your network (where `<SSID>` is your network name, and
  `<password>` is your network password).
- **N.B.** This only works with "regular" networks and _not_ with university
  networks or similar, which use WPA2 Enterprise or similar. These require
  manual configuration or a graphical front-end with templates to connect to. If
  you need to connect to this type of network, you will need to use a wired
  connection until you have reached the end of the install and then follow the
  [NetworkManager Front-End](#networkmanager-front-end) sub-section in the
  [Optional](#optional-applications-and-utilities) section at the very end of
  this guide.
- Congratulations, you are now connected to the internet, and will be when you
  reboot.

[sources:
  [SuperUser](superuser_archinternet),
  [Arch Wiki NetworkManager page](AW_nm)
]

## Update your system
- Make sure your install is up to date by running
  ```
  pacman -Syu
  ```

## Firewall
Follow the instructions [here](AW_firewall). I might type them out here at a
later point, but for now, just follow that wiki page. As far as I can tell, and
this is **purely speculation**, you only need to follow sections:
- `Firewall for a single machine`
  - `Creating necessary chains`
  - `The FORWARD chain`
  - `The OUTPUT chain`
  - `The INPUT chain`
  - `Resulting iptables.rules file`
  - `The TCP and UDP chains`
    - `Opening ports to incoming connections`
  - `"Hide" your computer`
    - `SYN scans`
    - `UDP scans`
    - `Restore the Final Rule`
  - `IPv6`
    - NOTE: after the copying of the IPv4 rules, I think you just edit the
      relevant lines with a text editor, i.e. replacing
      `--reject-with icmp-port-unreachable` and
      `--reject-with icmp-proto-unreachable` with
      `--reject-with icmp6-adm-prohibited`. And then save and exit the text
      editor. At least, that's what I did...
    - Then, follow the wiki from the point where it says something like "In the
      next step, make sure the protocol and extension are changed to be IPv6
      appropriate [...]".
  - `Saving the rules`

I haven't followed the crossed-out bit. I thought I needed to, but I am
currently less certain, after following the steps above.
~~I will be installing a firewall on top of `iptables`. I do not think this is
required, but I think it is strongly recommended. As far as I can tell, there
are two good candidates: ufw (Uncomplicated FireWall) and firewalld. I will be
using firewalld as it is
[recommended for the travelling laptop user](https://www.ctrl.blog/entry/ufw-vs-firewalld).
However, as the name suggests, ufw is _uncomplicated_ and you might prefer it.~https://wiki.archlinux.org/index.php/Sudo~
- ~~Install firewalld by running `pacman -S firewalld`.~~
- ~~Check the status of firewalld by running `firewall-cmd --state`. It will
  likely display~~
  ~~`not running` as you have only just installed it.~~
- ~~Start it by running `systemctl start firewalld`.~~
- ~~Enable it on boot by running `systemctl enable firewalld`.~~
- ~~Configure it by running [TODO]~~

## User
Installing Arch only creates the root user. Doing everything as root, i.e. with
unlimited control and priveleges is usually not advised, so create a new user:
- Run
  ```
  useradd --create-home <username>
  ```
  (where `<username>` is replaced by the username you want, e.g. `my-user`).
- Secure the user with a password by running `passwd <username>`.
- I am uncertain whether this step is needed, but since I am using
  NetworkManager for networks, I think I need to add my user to the `network`
  group. Do this by running
  ```
  usermod -aG network <username>
  ```

[source:
  [Arch Wiki Users and Groups](AW_users)
]

## Sudo
You might want to run certain instructions as root. In this case:
- If it is not already installed, install `sudo` by running
  ```
  pacman -S sudo
  ```
  If it is already installed, cancel the re-installation.
- Open a text editor by `EDITOR=<text editor> visudo` (e.g.
  `EDITOR=nano visudo` for using nano).
- Find the line where it says
  ```
  #%wheel    ALL=(ALL) ALL
  ```
  and remove the `#` at the beginning of the line.
  - This will allow users in the `wheel` group to use `sudo`.
- Add your newly created user to the `wheel` group by running
  ```
  usermod -aG wheel <username>
  ```

[source:
  [Arch Wiki sudo page](AW_sudo)
]

## Graphical User Interface
### Drivers
- In order to run the GUIs properly, we will need some drivers.
- Install the Intel drivers (for the iGPU) by running
  ```
  pacman -S xf86-video-intel
  ```
- Install the Nvidia drivers (for the dGPU/graphics card) by running
  ```
  pacman -S nvidia
  ```
- If they have not already been installed as a dependency of one of the previous
  drivers, install an OpenGL implementation by running
  ```
  pacman -S mesa
  ```

[source:
  [Arch Wiki Bumblebee page](AW_bumblebee)
]
### Bumblebee
- In Windows, the operating system automatically estimates whether the program
  being run is sufficiently graphically demanding to require use of the dGPU or
  whether the iGPU is enough, e.g. running a game vs. simply running the Windows
  GUI. Unfortunately, Linux does not support intelligent switching, but it does
  support discrete switching, i.e. using the iGPU for everything unless the user
  explicitly tells it to use the dGPU. This is accomplished through the
  "Bumblebee" project.
- **Before installing Bumblebee**, we need to switch back to hybrid graphics, so
  reboot and change the BIOS setting (`Configs -> Display -> Graphics Device`).
  Since we have installed the Intel drivers, this should be fine.
- Log back into Arch as your personal user, or as `root` if you
  do not want to use `sudo` for everything. (Or use `su` after logging in as
  your personal user. In this case you can also omit `sudo` at the beginning of
  all the next commands).
- Install Bumblebee by running
  ```
  sudo pacman -S bumblebee
  ```
- Add your user to the "bumblebee" group by running
  ```
  sudo usermod -aG network <username>
  ```
- Enable Bumblebee by running
  ```
  sudo systemctl enable bumblebeed.service
  ```
- Reboot and log in (again, as whichever user you want/find most convenient).

[source:
  [Arch Wiki Bumblebee page](AW_bumblebee)
]
### The X Window System
- In order to run a GUI, you will need to install the X Window System, provided
  by [X.org](https://www.x.org/wiki/).
  - There is a different window system called "Wayland", but it is still in
    development and not as widely supported as X. If you know what you are doing
    at this stage though, feel free to install Wayland instead.
- Install X by running
  ```
  sudo pacman -S xorg
  ```

[source:
  [Arch Wiki Xorg page](AW_xorg)
]
### Desktop Environments
Personally, because I wanted to try it, I will be installing a display manager
and a window manager manually. **This is by no means the easiest, "Get this
laptop working" solution!**. I am only doing this out of personal interest for
how these things work and fit together. **If you want a solution that just works
out of the box, you probably want a desktop environment** (in which case, keep
reading).However, if you, like me, want to do everything by hand, then
[skip this section](#display-managers).
- A Desktop Environment is what most of us would associate with a GUI: a
  graphical login interface (aka. a "display manager"), a graphical user
  interface (aka. a "window manager"), little menus and icons for everything. If
  that is what you are looking for, you can install one of the following, or
  refer to the [relevant Arch Wiki Page](AW_de).
  - [Cinnamon](AW_cinnamon) - What most users will probably associate with a
    "traditional" desktop interface. It can be installed by running
    ```
    sudo pacman -S cinnamon
    ```
  - [Gnome](AW_gnome) - A "new" dektop feel, especially if you are coming from
    Windows and about to use Linux for the first time (in which case I think you
    have jumped in at the deep end by directly going with Arch). It's used as
    the default DE for Ubuntu (since LTS 18.04) and Fedora, so users familiar
    with these distros should feel right at home if they install this. It can be
    installed by running
    ```
    sudo pacman -S gnome
    ```
    and installing all the packages in the group (this is the default option).
  - [Deepin](AW_deepin) - A more modern, "Windows 10 done right" experience
    (in my opinion). It looks beautiful and sleek, but I have heard rumours it
    is complicated to uninstall. It is developed by a Chinese company so there
    are also rumours that it might be spying on its users. I do not know if any
    of this is true, you will have to research this yourself. If that does not
    concern you though and you like the look of Deepin, it can be installed by
    running
    ```
    sudo pacman -S deepin deepin-extras
    ```
    and installing all the packages in the groups (this is the default option).
- **If you have installed a DE, please follow its Arch Wiki page to learn if and
  how it needs configuring after install.** Apart from that, I think that is you
  done. Congratulations on your new Linux install! :-)

[sources:
  [Arch Wiki DE page](AW_de),
  [Arch Wiki Cinnamon page](AW_cinnamon),
  [Arch Wiki Gnome page](AW_gnome),
  [Arch Wiki Deepin page](AW_deepin)
]
### Display Managers
NOTE: If you have installed a DE, you are probably done and do not need to read
any further.
- The X server is not automatically started. Usually, this is done by the
  [display manager](AW_dm).
- I will be using LightDM. If you have a preference for a different one, install
  that one instead (or see
  [the list of graphical display managers](https://wiki.archlinux.org/index.php/Display_manager#Graphical)).
- Install LightDM by running
  ```
  sudo pacman -S lightdm lightdm-gtk-greeter
  ```
- Then, enable it by running
  ```
  sudo systemctl enable lightdm.service
  ```

[sources:
  [Arch Wiki Display Manager page](AW_dm),
  [Arch Wiki LightDM page](AW_lightdm)
]
### Window Managers
- You will usually want something to arrange and open graphical windows. This is
  what is known as a window manager.
- I will be using i3-gaps. It is a so-called "tiling" window manager. If you do
  not like i3 or would like a more "traditional", so-called "stacking" window
  manager, have a look through
  [this list](https://wiki.archlinux.org/index.php/Window_manager#Stacking_window_managers)
  and follow the install instructions for the one you would like.
- If you have not picked a different WM, install i3-gaps by running
  ```
  sudo pacman -S i3-gaps
  ```
- Then, in order to see info about your computer (such as current time, battery
  charge, which workspace you are on, etc.) and in order to be able to launch
  applications, install i3status and dmenu by running
  ```
  sudo pacman -S i3status dmenu
  ```

[sources:
  [Arch Wiki WM page](AW_wm),
  [Arch Wiki i3 page](AW_i3)
]
### Screen Locking
- In order to be able to lock your screen (e.g. by pressing `Windows`+`l` when
  in Windows), you need a screen locker. LightDM has one called "light-locker"
  which is what I will be using. If you prefer a different locker, or want to
  explore the options, [here is the list of screen lockers](AW_scrlock).
- If you have not picked a different screen locker, install light-locker by
  running
  ```
  sudo pacman -S light-locker
  ```
- Now we have most things set to log in. Reboot by running
  ```
  reboot
  ```
- If you set a different keyboard layout, keep reading. If you did not do that,
  skip to [here](#terminal-emulator).

[source:
  [Arch Wiki list of screen lockers](AW_scrlock)
]
### Keyboard Layout \[OPTIONAL\]
If you have set a different keyboard layout, you will notice that your nice, new
graphical login prompt does not use it. This is because the X window system uses
its own configuration files. We need to tell it which layout to use.
- Change to a command prompt by pressing `Ctrl`+`Alt`+`F1` and login.
- Change the layout, e.g. in my case to Norwegian Dvorak by running
  ```
  sudo localectl --no-convert set-x11-keymap no thinkpad dvorak
  ```
- In general, the format is
  ```
  sudo localectl --no-convert set-x11-keymap <layout> [<keyboard_model> [<keyboard_variant>]]
  ```
  where `<keyboard_model>` is optional, but has to be provided if
  `<keyboard_variant>` is wanted to be provided.
  - I think the keymap model `thinkpad` is the right one, but I do not know for
    certain. A list of keyboard models can be gotten by running
    ```
    localectl list-x11-keymap-models
    ```
  - A list of layouts can be gotten by running
    ```
    localectl list-x11-keymap-layouts
    ```
  - A list of variants can be gotten by running
    ```
    localectl list-x11-keymap-variants <layout>
    ```
    where `<layout>` is the layout you want the variants of.
- Reboot by running
  ```
  reboot
  ```
- The layout should now work.

[sources:
  [Arch Wiki keyboard layout using localectl page](AW_keyblocalectl),
  `man 1 localectl`
]
### Terminal Emulator
In order to have access to a command prompt from your window manager, you will
need to install a terminal emulator. I will be using "Terminator", but
[here is the list](AW_termem)
if you want to pick one for yourself.
- Change to a command prompt by pressing `Ctrl`+`Alt`+`F1` and login.
- Install Terminator by running
  ```
  sudo pacman -S terminator
  ```
- Logout by running
  ```
  logout
  ```
- You should now be able to use Terminator at your window manager (which you
  can usually change back to by pressing `Ctrl`+`Alt`+`F7`).

[source:
  [Arch Wiki terminal emulators section](AW_termem)
]
### Configuring Screen Locking
- Light-locker does not run by default, you need to configure i3 (or whichever
  window manager you chose) to start it.
- Open the file `~/.config/i3/config` in a text editor.
- Add the following line to the file (I added it to the end of it)
  ```
  exec_always --no-startup-id "light-locker --lock-on-suspend --late-locking &"
  ```
  (see `man 1 light-locker` for details on what flags are available and what
  they do).
- If you want to make `Windows`+`l` lock the screen, add the following line to
  the file
  ```
  bindsym $mod+l exec --no-startup-id "light-locker-command -l"
  ```

[sources:
  fiddling about with light-locker and light-locker-command to figure out why
  they were not working as I thought they were,
  `man 1 light-locker`,
  `man 1 light-locker-command`
]
### Browser
- Install the internet browser you want, I will be installing firefox. A list of
  browsers can be found in the "web browsers" section of
  [this page](AW_applist).
- If you are fine with firefox, install it by running
  ```
  sudo pacman -S firefox
  ```

[source:
  [Arch Wiki Firefox page](AW_firefox),
  "web browsers" section of the [Arch Wiki application list](AW_applist)
]
### LibreOffice
- LibreOffice is an open-source selection of programs similar to Microsoft
  Office. If you want a package solution with a text-editor, spreadsheet editor,
  presentation tool, etc., then this is probably the easiest way to do it.
- If, on the other hand, you do not need all these tools, and only need a/some
  text editor(s), skip to [here](#text-editors).
- Install LibreOffice by running
  ```
  sudo pacman -S libreoffice-fresh
  ```
- Skip to [here](#time-synchronisation).

[source:
  [Arch Wiki LibreOffice page](AW_libre)
]
### Text Editors
- I will be installing two text editors (atom and vim).
- Install these by running
  ```
  pacman -S atom vim
  ```

[sources:
  [Arch Wiki Atom page](AW_atom),
  [Arch Wiki Vim page](AW_vim)
]
### Time Synchronisation
Your system time can become out of sync with the actual time. To ensure this
does not happen, the `systemd-timesyncd` service can be started (and enabled if
you want it to remain on across reboots).
- Start the service by running
  ```
  sudo systemctl start systemd-timesyncd.service
  ```
- Open the `/etc/systemd/timesyncd.conf` in a text editor, e.g. using
  nano:
  ```
  sudo nano /etc/systemd/timesyncd.conf
  ```
- Uncomment, i.e. remove the `#` at the beginning, the first two lines under the
  \[Time\] section (i.e. the `NTP=` and `FallbackNTP=` lines).
- The general recommendation is to use the `pool.ntp.org` servers. This can be
  done by editing the `NTP=` line to look like this:
  ```
  NTP=0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org
  ```
- Otherwise, if you know you will almost always be in a specific geographical
  region, e.g. I will likely always be in Europe, you can have it look like this
  (as an example):
  ```
  NTP=0.europe.pool.ntp.org 1.europe.pool.ntp.org 2.europe.pool.ntp.org 3.europe.pool.ntp.org
  ```
  See the "Active Servers" banner on [this page](ntppool) for a list of server
  regions.
- I then chose to use the Arch servers as my fallback. So my `FallbackNTP` line
  looks like this:
  ```
  FallbackNTP=0.arch.pool.ntp.org 1.arch.pool.ntp.org 2.arch.pool.ntp.org 3.arch.pool.ntp.org
  ```
- NOTE: You will still need to manually change your time zone by running
  ```
  sudo timedatectl set-timezone <Zone>/<Sub-zone>
  ```
  or using the interactive tool, i.e. by running
  ```
  sudo tzselect
  ```

[sources:
  [Arch Wiki System Time page](AW_systime),
  [Arch Wiki timesyncd page](AW_timesyncd),
  [NTP pool project](ntppool)
]
### Done.
I think this more or less concludes a complete system. I have made a
[final section](#optional-applications-and-utilities) with various programs that
you may want to install but that I would not necessarily consider essential.
Feel free to skim through it or to stop here. If I remember, I will expand the
sections as I come across things I missed that I later needed.
In any case, I hope this guide was helpful. :-)


# Optional Applications and Utilities
This is a list of programs that you may want to install, depending on how pretty
you want things to look, or if you want additional functionality.

## Arch List of Applications \[GENERAL INFO\]
The Arch Wiki has a [list of applications](AW_applist) which contains links to
the Arch Wiki page (if there is one) and packages of numerous programs. If you
are looking for something, and I have not listed it below, there is a very good
chance you will find it there.

[source:
  [Arch Wiki List of Applications](AW_applist)
]

## Arch User Repository (AUR) \[GENERAL INFO\]
If you have looked at different packages, you may have noticed that some of them
have `AUR` listed next to them. This means that they are provided by the Arch
User Repo. If you wish to install any packages from the AUR, e.g. the
`google-chrome` package, I strongly suggest you read
[the relevant Arch Wiki page](AW_aur) for the instructions and dangers involved
in installing AUR packages.
- To install packages from the AUR, you will first need `base-devel`. If you did
  not install it at the beginning, do so now by running
  ```
  sudo pacman -S --needed base-devel
  ```
- If it is not already installed, install `git` by running
  ```
  sudo pacman -S git
  ```
  If it is already installed and you are trying to install it, cancel the
  reinstallation.
- I made a directory for containing my AUR packages, you may choose to do so or
  simply have the package directories in your home directory or something. I
  made a hidden AUR directory by running
  ```
  mkdir ~/.aur
  ```

[sources:
  [Arch Wiki AUR page](AW_aur),
  [Arch Wiki git page](AW_git)
]
### Example: Installing Google Chrome \[OPTIONAL\]
- If you have not already done so, change into your AUR directory (if you made
  one, e.g. in my case `~/.aur`) by running
  ```
  cd ~/.aur
  ```
- Find the git clone url on the [AUR packages page](AUR_packages), e.g. by
  searching for "google-chrome" and clicking on that package link. The url, at
  the time of writing, looked like this for me:
  ```
  https://aur.archlinux.org/google-chrome.git
  ```
- Clone the directory by running
  ```
  git clone <URL>
  ```
  Where `<URL>` is the git url for the package, e.g.
  ```
  https://aur.archlinux.org/google-chrome.git
  ```
- Change into the newly created `google-chrome` directory by running
  ```
  cd google-chrome
  ```
- **Check the `PKGBUILD` and any `.install` files carefully for malicious code**
  by viewing them using `less <filename>`, or `cat <filename>`, or
  `view <filename>` (if you have vim installed).
- **When you are certain the package does not contain malicious code**, install
  it by running
  ```
  mkpkg -sic
  ```
- NOTE: If the package depends on other AUR packages, you have to manually
  install these first, and it is your responsibility to keep AUR packages
  updated.

[sources:
  [AUR packages page](AUR_packages),
  [Arch Wiki AUR page](AW_aur),
  [Arch Wiki Chromium page](AW_chromium)
]

## NetworkManager Front-End \[OPTIONAL\]
- I will be installing a graphical front-end for NetworkManager. This is because
  I need to connect to WPA2 Enterprise networks (e.g. eduroam), which can either
  be done by configuring the connection manually or by having a GUI which
  contains a template.
- Install `network-manager-applet` by running
  ```
  pacman -S network-manager-applet
  ```
- You can now start the front-end by running
  ```
  nm-connection-editor
  ```
  either in a terminal, or through `dmenu` (the i3 "application launcher").
- Make sure you have downloaded or otherwise obtained the relevant certificates
  for connecting to your enterprise network.
- You should be able to add connections by clicking the little `+` icon in the
  bottom left corner. The section for connecting to WPA2 Enterprise networks is
  then located under the `Wi-Fi Security` tab when adding a new Wi-Fi
  connection.

[source:
  [Arch Wiki NetworkManager page](AW_nm)
]
## Background Image \[OPTIONAL\]
- Download or transfer an image that you wish to use as your desktop background.
  Make sure you note the path to the image, e.g. `~/Downloads/my_bg_image.png`.
- Install `feh` by running
  ```
  sudo pacman -S feh
  ```
- At the time of writing, feh supports the following background modes:
  - `--bg-tile` - Tile the background image if it is too small.
  - `--bg-center` - Place the background image at the center of the screen.
  - `--bg-scale` - Scale the background image to the screen size. No borders
    are created and parts of the image are not cut, but it may appear
    "stretched" if it does not fit the screen's aspect ratio.
  - `--bg-max` - Scale the background image to the maximum sive that fits the
    screen, with borders on one side.
  - `--bg-fill` - Scale the background image, but preserve the aspect ratio such
    that image fits but some parts are cut off if it does not fit the screen's
    aspect ratio.
- For this example, to set the background image using the "center" mode, run
  ```
  feh --bg-center <path/to/file>
  ```
  where `<path/to/file>` is the path to the file you wish to use as a background
  image.
- This will create a `~/.fehbg` file which is used to keep/set the image after
  reboots. So to make the background image persistent, in i3, add the following
  line to your `~/.config/i3/config` file:
  ```
  exec --no-startup-id ~/.fehbg &
  ```
- Your background image will now be displayed, even after reboots.

[sources:
  [Arch Wiki Feh page](AW_feh),
  `man 1 feh`
]

## Email Client \[OPTIONAL\]
I will be using Thunderbird as my email client. It is developed by Mozilla, the
same people who made Firefox, and I quite like it. You can find a list of email
clients in the "Email client" section of the
[Arch Wiki List of Applications](AW_applist).
- Install Thunderbird by running
  ```
  sudo pacman -S thunderbird
  ```
- You can now start Thunderbird from i3.

[sources:
  [Arch Wiki Thunderbird page](AW_thunderbird),
  [Arch Wiki List of Applications](AW_applist)
]

## Screenshot Utility \[OPTIONAL\]
- You can install a [screenshot program](AW_scrcapture) if
  you want to. I will be installing "flameshot".
- Install flameshot by running
  ```
  sudo pacman -S flameshot
  ```
- You can now start flameshot from i3.

[source:
  [Arch Wiki screen capture page](AW_scrcapture)
]
