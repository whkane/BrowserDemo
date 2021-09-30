*** Settings ***
Library   Browser

*** Variables ***
@{browsers}         chromium    firefox     webkit
${url}              http://dystocracy.com/
${spotify_url}      https://open.spotify.com/album/3P9l1i2XMdHnlCkFJt1dKX?si=eha9DCe9TAaOUbmLWUlLoQ&dl_branch=1
${timeout}          5s

*** Test Cases ***
Page Ids And Text
    [Documentation]     Read page ids and a certain text with all browsers.

    FOR     ${browser}  IN  @{browsers}
        New Browser     ${browser}     False
        New Page        ${url}
        ${ids}=         Get Page Ids   ACTIVE    ACTIVE      ACTIVE
        Log             ${ids}
        Wait Until Network Is Idle     timeout=${timeout}
        Click           id=menu-item-97
        Wait Until Network Is Idle     timeout=${timeout}
        Click           id=menu-item-157
        Wait Until Network Is Idle     timeout=${timeout}
        ${text} =       Get Text       id=post-146
        Log             ${text}
        Close Page      CURRENT
    END

Open Facebook
    [Documentation]     Opens Facebook page from a link with all browsers.

    FOR     ${browser}  IN  @{browsers}
        New Browser     ${browser}     False
        New Page        ${url}
        ${elements}=    Get Elements   //*[@title="Facebook"]
        Wait Until Network Is Idle     timeout=${timeout}
        Click           ${elements}[0]
        Wait Until Network Is Idle     timeout=${timeout}
        ${text} =       Get Text       id=seo_h1_tag
        Log             ${text}
        Close Page      CURRENT
    END

Open Twitter
    [Documentation]     Opens Twitter page from a link with all browsers.

    FOR     ${browser}  IN  @{browsers}
        New Browser     ${browser}     False
        New Page        ${url}
        Wait Until Network Is Idle     timeout=${timeout}
        ${elements}=    Get Elements   //*[@title="Twitter"]
        Click           ${elements}[0]
        Wait Until Network Is Idle     timeout=${timeout}
        ${status}=      Run Keyword And Return Status  Get Text       //*[@href="/Dystocracycrew/followers"]
        Run Keyword If  not ${status}  Click           ${elements}[0]
        ${text} =       Get Text       //*[@href="/Dystocracycrew/followers"]
        Log             ${text}
        Close Page      CURRENT
    END

Open Youtube
    [Documentation]     Opens Youtube page from a link with all browsers and streams a video.

    FOR     ${browser}  IN  @{browsers}
        New Browser     ${browser}     False
        New Page        ${url}
        Wait Until Network Is Idle     timeout=${timeout}
        ${elements}=    Get Elements   //*[@title="Youtube"]
        Click           ${elements}[0]
        Wait Until Network Is Idle     timeout=${timeout}
        Run Keyword And Ignore Error   Click    //*[@aria-label="Agree to the use of cookies and other data for the purposes described"]
        Wait Until Network Is Idle     timeout=${timeout}
        ${text} =       Get Text       id=subscriber-count
        Log             ${text}
        Click           //*[@title="DYSTOCRACY - Slave Morality (Studio Lyric Video)"]
        Wait Until Network Is Idle     timeout=${timeout}
        #Let the video play for 30s and pause.
        Sleep           30s
        Keyboard Key    press          Backspace
        Sleep           2s
        Close Page      CURRENT
    END

Open Spotify
    [Documentation]     Opens Spotify page to the band's latest EP and plays every song for 30 sec.

    FOR     ${browser}  IN  @{browsers}
        New Browser     ${browser}     False
        New Page        ${spotify_url}
        Wait Until Network Is Idle     timeout=${timeout}
        Click           id=tippy-36
        Close Page      CURRENT
    END