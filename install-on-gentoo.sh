#!/bin/bash
echo "Welcome!"
echo "Warning! Have you installed the dependencies already? If not, please do so before continuing or stuff wont work!"
echo "Dependencies are mentioned in README. Here they are anyways:"
echo "1) xmonad (by portage)"
echo "2) tint2 (by portage)"
echo "3) acpi (by portage)"
echo "4) zsh (by portage)"
echo "5) picom (ibhagwan) (https://github.com/ibhagwan/picom)"
echo "6) alacritty (by portage)"
echo "7) dunst (by portage)"
echo "8) rofi (v 1.6.0) (echo '=rofi-1.6.0 ~amd64' >> /etc/portage/package.accept_keywords && emerge rofi)"
echo "9) candy-icon theme (https://github.com/EliverLara/candy-icons)"
echo "10) NetworkManager (by portage)"
echo "11) feh (by portage)"
echo "That should be the basics"
read -r -p "Continue? [yes/no]: " conti

case $conti in
[yY][eE][sS]|[yY])  
    mkdir -p ~/.local/share/fonts
    cp -r ./fonts/* ~/.local/share/fonts/
    fc-cache
    clear 
    if [ -d ~/.config/rofi ]; then
        echo "Rofi configs detected, backing up..."
        mkdir -p ~/.config/rofi.old && mv ~/.config/rofi/* ~/.config/rofi.old/
        cp -r ./rofi/* ~/.config/rofi;
    else
        echo "Installing rofi configs..."
        mkdir ~/.config/rofi && cp -r ./rofi/* ~/.config/rofi;
    fi
    if [ -d ~/.config/eww ]; then
        echo "Eww configs detected, backing up..."
        mkdir ~/.config/eww.old && mv ~/.config/eww/* ~/.config/eww.old/
        cp -r ./eww/* ~/.config/eww;
    else
        echo "Installing eww configs..."
        mkdir ~/.config/eww && cp -r ./eww/* ~/.config/eww;
    fi
    if [ -f ~/.config/picom.conf ]; then
        echo "Picom configs detected, backing up..."
        cp ~/.config/picom.conf ~/.config/picom.conf.old;
        cp ./picom.conf ~/.config/picom.conf;
    else
        echo "Installing picom configs..."
         cp ./picom.conf ~/.config/picom.conf;
    fi
    if [ -f ~/.config/alacritty.yml ]; then
        echo "Alacritty configs detected, backing up..."
        cp ~/.config/alacritty.yml ~/.config/alacritty.yml.old;
        cp ./alacritty.yml ~/.config/alacritty.yml;
    else
        echo "Installing alacritty configs..."
         cp ./alacritty.yml ~/.config/alacritty.yml;
    fi
    if [ -d ~/.config/dunst ]; then
        echo "Dunst configs detected, backing up..."
        mkdir ~/.config/dunst.old && mv ~/.config/dunst/* ~/.config/dunst.old/
        cp -r ./dunst/* ~/.config/dunst;
    else
        echo "Installing dunst configs..."
        mkdir ~/.config/dunst && cp -r ./dunst/* ~/.config/dunst;
    fi
    if [ -d ~/wallpapers ]; then
        echo "Adding wallpaper to ~/wallpapers..."
        cp ./wallpapers/yosemite-lowpoly.jpg ~/wallpapers/;
    else
        echo "Installing wallpaper..."
        mkdir ~/wallpapers && cp -r ./wallpapers/* ~/wallpapers/;
    fi
    if [ -d ~/.config/tint2 ]; then
        echo "Tint2 configs detected, backing up..."
        mkdir ~/.config/tint2.old && mv ~/.config/tint2/* ~/.config/tint2.old/
        cp -r ./tint2/* ~/.config/tint2;
    else
        echo "Installing tint2 configs..."
        mkdir ~/.config/tint2 && cp -r ./tint2/* ~/.config/tint2;
    fi
    if [ -d ~/.xmonad ]; then
        echo "XMonad configs detected, backing up..."
        mkdir ~/.xmonad.old && mv ~/.xmonad/* ~/.xmonad.old/
        cp -r ./xmonad/* ~/.xmonad/;
    else
        echo "Installing xmonad configs..."
        mkdir ~/.xmonad && cp -r ./xmonad/* ~/.xmonad;
    fi
    if [ -d ~/bin ]; then
        echo "~/bin detected, backing up..."
        mkdir ~/bin.old && mv ~/bin/* ~/bin.old/
        cp -r ./bin/* ~/bin;
    else
        echo "Installing bin configs..."
        mkdir ~/bin && cp -r ./bin/* ~/bin/;
        echo "Please add: export PATH='$PATH:/home/{Your_user}/bin' to your .zshrc. Replace {Your_user} with your username."
    fi
    printf "\n"
    echo "PLEASE MAKE .xinitrc TO LAUNCH, or just use your dm" > ~/Note.txt
    echo "run 'p10k configure' to set up your zsh" >> ~/Note.txt
    echo "after you this -> 'git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k'" >> ~/Note.txt
    printf "\n" >> ~/Note.txt
    echo "Please add: export PATH='$PATH:/home/{Your_user}/bin' to your .zshrc if not done already. Replace {Your_user} with your username." >> ~/Note.txt
    echo "For startpage, copy the startpage directory into wherever you want, and set it as new tab in firefox settings." >> ~/Note.txt
    echo "For more info on startpage (Which is a fork of Prismatic Night), visit https://github.com/dbuxy218/Prismatic-Night#Firefoxtheme" >> ~/Note.txt
    echo "ALL DONE! Issue `xmonad --recompile` and then re-login for all changes to take place!" >> ~/Note.txt
    echo "Make sure your default shell is ZSH too..." >> ~/Note.txt
    echo "Open issues on github or ask me on discord or whatever if you face issues." >> ~/Note.txt
    echo "Install Museo Sans as well. Frome Adobe I believe."
    cat ~/Note.txt;
    echo "These instructions have been saved to ~/Note.txt. Make sure to go through them."
	;;


[nN][oO]|[nN])
    echo "Quitting. INSTALL THOSE DEPENDENCIES. YOU USE GENTOO. YOU DO KNOW HOW TO DO IT."
    ;;

[*])
    echo "Quitting. INSTALL THOSE DEPENDENCIES. YOU USE GENTOO. YOU DO KNOW HOW TO DO IT."
	;;
esac
