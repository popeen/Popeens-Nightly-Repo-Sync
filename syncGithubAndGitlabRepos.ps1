if($(((Get-Item -Path ".\").FullName).split("\")| Select-Object -Last 1) -eq "Popeens-Nightly-Repo-Sync"){
    Set-Location ..\
}

$repos = @(

    @{
        "Name" = "EasyGUI"
        "PrimaryRepo" = "https://gitlab.com/Popeen/EasyGUI"
        "SecondaryRepo" = "https://github.com/popeen/EasyGUI"
    },

    @{
        "Name" = "BooksonicApp"
        "PrimaryRepo" = "https://github.com/popeen/Popeens-DSub"
        "SecondaryRepo" = "https://gitlab.com/Popeen/booksonic-android-app"
    },

    @{
        "Name" = "BooksonicServer"
        "PrimaryRepo" = "https://github.com/popeen/Popeens-Subsonic"
        "SecondaryRepo" = "https://gitlab.com/Popeen/booksonic-server"
    },

    @{
        "Name" = "Booksonic-Chromecast"
        "PrimaryRepo" = "https://github.com/popeen/Booksonic-Chromecast"
        "SecondaryRepo" = "https://gitlab.com/Popeen/booksonic-chromecast"
    },

    @{
        "Name" = "Booksonic-Bridge"
        "PrimaryRepo" = "https://github.com/popeen/Booksonic-Bridge"
        "SecondaryRepo" = "https://gitlab.com/Popeen/booksonic-bridge"
    },

    @{
        "Name" = "ServerProxy"
        "PrimaryRepo" = "https://github.com/popeen/ServerProxy"
        "SecondaryRepo" = "https://gitlab.com/Popeen/serverproxy"
    },

    @{
        "Name" = "WebRemote-TCL-S69"
        "PrimaryRepo" = "https://github.com/popeen/WebRemote-TCL-S69"
        "SecondaryRepo" = "https://gitlab.com/Popeen/webremote-tcl-s69"
    },

    @{
        "Name" = "Booksonic-Podcast-List-JSON"
        "PrimaryRepo" = "https://gitlab.com/Popeen/booksonic-podcast-list-json"
        "SecondaryRepo" = "https://github.com/popeen/Booksonic-Podcast-List-JSON"
    },

    @{
        "Name" = "Popeens-Home-Assistant-Configuration"
        "PrimaryRepo" = "https://gitlab.com/Popeen/popeens-home-assistant-configuration"
        "SecondaryRepo" = "https://github.com/popeen/Popeens-Home-Assistant-Configuration"
    },

    @{
        "Name" = "Booksonic-Export-Booksonic-Metadata-from-ODM-Files"
        "PrimaryRepo" = "https://github.com/popeen/Booksonic-Export-Booksonic-Metadata-from-ODM-Files"
        "SecondaryRepo" = "https://gitlab.com/Popeen/Booksonic-Export-Booksonic-Metadata-from-ODM-Files"
    },

    @{
        "Name" = "Popeens-Nightly-Repo-Sync"
        "PrimaryRepo" = "https://github.com/popeen/Popeens-Nightly-Repo-Sync"
        "SecondaryRepo" = "https://gitlab.com/Popeen/Popeens-Nightly-Repo-Sync"
    }
)

$repos| Foreach-Object{
    
    if(-not (Test-Path($_.name))){
        git clone $_.PrimaryRepo $_.Name
    }
    cd $_.Name
    git pull --progress -v --no-rebase $_.PrimaryRepo master
    git pull --progress -v --no-rebase $_.SecondaryRepo master
    git push --progress $_.PrimaryRepo master:master
    git push --progress $_.SecondaryRepo master:master
    cd ..


}
