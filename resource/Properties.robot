*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.

Resource        Import.robot


*** Variables ***
${WELCOMEPAGE_URL}              https://mixap-dev.surge.sh/
${DELAY}                        0
${TITLE}                        MIXAP
${PAUSE}                        2