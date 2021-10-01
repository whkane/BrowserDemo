*** Settings ***
Force Tags          Dystocracy

Library             Browser
Library             RPA.Desktop.Windows

*** Variables ***
@{browsers}         chromium    firefox     webkit
${url}              http://dystocracy.com/
${search}           Dystocracy
${bandcamp_url}     https://dystocracy.bandcamp.com/
@{eps}              Dystocracy      Slave Morality
@{st_songs}         Play Dachau       Play Dystocracy     Play Thousand Fiery Lashes      Play Final Abyss
@{sm_songs}         Play Manifold       Play Slave Morality     Play Forever Open Eyes      Play From the Ruins of War (Year 6)
${timeout}          5s
${play_duration}    30s

*** Test Cases ***
Page Ids And Text
    [Documentation]     Read page ids and a certain text with all browsers.
    [Tags]              Pageid

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
        ${text} =       Browser.Get Text       id=post-146
        Log             ${text}
        Close Page      CURRENT
    END

Open Facebook
    [Documentation]     Opens Facebook page from a link with all browsers.
    [Tags]              Facebook

    FOR     ${browser}  IN  @{browsers}
        New Browser     ${browser}     False
        New Page        ${url}
        ${elements}=    Get Elements   //*[@title="Facebook"]
        Wait Until Network Is Idle     timeout=${timeout}
        Click           ${elements}[0]
        Wait Until Network Is Idle     timeout=${timeout}
        Click           //*[@title="Hyväksy kaikki"]
        ${text} =       Browser.Get Text       id=seo_h1_tag
        Log             ${text}
        Close Page      CURRENT
    END

Open Twitter
    [Documentation]     Opens Twitter page from a link with all browsers.
    [Tags]              Twitter

    FOR     ${browser}  IN  @{browsers}
        New Browser     ${browser}     False
        New Page        ${url}
        Wait Until Network Is Idle     timeout=${timeout}
        ${elements}=    Get Elements   //*[@title="Twitter"]
        Click           ${elements}[0]
        Wait Until Network Is Idle     timeout=${timeout}
        ${status}=      Run Keyword And Return Status  Browser.Get Text       //*[@href="/Dystocracycrew/followers"]
        Run Keyword If  not ${status}  Click           ${elements}[0]
        Click           text=Close
        ${text} =       Browser.Get Text       //*[@href="/Dystocracycrew/followers"]
        Log             ${text}
        Close Page      CURRENT
    END

Open Youtube
    [Documentation]     Opens Youtube page from a link with all browsers and streams a video.
    [Tags]              Youtube

    FOR     ${browser}  IN  @{browsers}
        New Browser     ${browser}     False
        New Page        ${url}
        Wait Until Network Is Idle     timeout=${timeout}
        ${elements}=    Get Elements   //*[@title="Youtube"]
        Click           ${elements}[0]
        Wait Until Network Is Idle     timeout=${timeout}
        Run Keyword And Ignore Error   Click    //*[@aria-label="Agree to the use of cookies and other data for the purposes described"]
        Wait Until Network Is Idle     timeout=${timeout}
        ${text} =       Browser.Get Text       id=subscriber-count
        Log             ${text}
        Click           //*[@title="DYSTOCRACY - Slave Morality (Studio Lyric Video)"]
        Wait Until Network Is Idle     timeout=${timeout}
        #Let the video play for a duration and pause.
        Sleep           ${play_duration}
        Keyboard Key    press          Backspace
        Sleep           2s
        Close Page      CURRENT
    END

Open Spotify
    [Documentation]     Opens Spotify on Windows desktop and plays songs from band's catalogue.
    [Tags]              Spotify

    Open From Search    Spotify         Spotify Free
    Sleep               ${timeout}
    Play Random Songs   ${search}
    Close All Applications

Open Bandcamp
    [Documentation]     Opens Bandcamp page to the band's EP's and plays every song for 30 sec.
    [Tags]              Bandcamp

    FOR     ${browser}  IN  @{browsers}
        New Browser     ${browser}     False
        New Page        ${bandcamp_url}
        Wait Until Network Is Idle     timeout=${timeout}
        Play EP Through                ${eps}[0]       @{st_songs}
        Go To           ${bandcamp_url}
        Play EP Through                ${eps}[1]       @{sm_songs}
        Close Page      CURRENT
    END

*** Keywords ***
Play EP Through
    [Documentation]     Plays each song for 30 sec from selected EP.
    [Arguments]         ${ep}   @{songs}

    ${elements}=    Get Elements   text="${ep}"
    Click           ${elements}[0]
    Wait Until Network Is Idle     timeout=${timeout}
    FOR   ${song}   IN      @{songs}
        Click       //*[@aria-label="${song}"]
        Sleep       ${play_duration}
        Wait Until Network Is Idle     timeout=${timeout}
        Click       //*[@aria-label="${song}"]
    END
    Wait Until Network Is Idle     timeout=${timeout}

Play Random Songs
    [Documentation]     Plays random songs in Spotify for 30 sec duration.
    [Arguments]         ${search}

    Send Keys To Input  ^l
    Send Keys To Input  ${search}
    Send Keys To Input  {ENTER}        with_enter=False
    Send Keys To Input  {TAB}{TAB}     with_enter=False
    Send Keys To Input  {ENTER}        with_enter=False
    Sleep               ${play_duration}
    Send Keys To Input  {ENTER}        with_enter=False
    Send Keys To Input  {TAB}{TAB}
    Send Keys To Input  {ENTER}        with_enter=False
    Send Keys To Input  {TAB}          with_enter=False

    FOR   ${index}   IN RANGE   ${7}
        Send Keys To Input  {DOWN}     with_enter=False
        Send Keys To Input  {ENTER}    with_enter=False
        Sleep               ${play_duration}
        Send Keys To Input  {ENTER}    with_enter=False
    END