   ' ANALOG CLOCK
   ' Case Study Problem B3: Program 1
   ' ---------------------------------------------------------------------------
   ' written by Eugene Villar http://seavsoftwares.codedgraphic.com/home_page.html
   ' ~ This program draws a very simple analog clock.
   ' modified for Maximite BASIC by Bob Devries
   '*** modified by Hugh Buckle in Dec 2011 to request and verify current date and time
   '*** re-engineered by Danny Arnold 2020 for MMBASIC V5.xxx on Colour Maximite 2 computer
   ' 
   Mode 1,8
   backcol = RGB(140,140,140)
   Colour 0,backcol
   Timer = Val(Left$(Time$,2)) * 3600 + Val(Mid$(Time$,4,2)) * 60 + Val(Right$(Time$,2))
   '*** Get current date and time
   '*** days in each month used in the date/time request subroutine
   Data 31,29,31,30,31,30,31,31,30,31,30,31
   GoSub L004
   ' Clock border   
   Cls
   'Line 0,0,480,432,1,BF
   'Line 11,12,469,421,1,BF
   GoSub L001
START:   
   clockcen = (MM.HRES/2)
   title$= "MAXIMITE COLOUR 2 Clock demo"
   Text clockcen,40,title$,"CM",4,1,RGB(RED)
   GoSub L002
   Text clockcen,60,"MMBASIC v" + version$,"CM",1,1,RGB(BLUE)
   clkcenv = (MM.VRES / 2)
   Text clockcen,MM.VRES - 20,"Press SPACE to change the time","CM",1,1,RGB(BLUE)
   Circle clockcen,clkcenv, 200, 1
   Circle clockcen,clkcenv,199,1
   For i=0 To 59
   rads=i*3.14159265/30
   If i Mod 5 <> 0 Then
   x1=Sin(rads)*195+clockcen
   y1=-Cos(rads)*195+clkcenv
   Else
   x1=Sin(rads)*190+clockcen
   y1=-Cos(rads)*190+clkcenv
   EndIf
   x2=Sin(rads)*200+clockcen
   y2=-Cos(rads)*200+clkcenv
   Line x1,y1,x2,y2,1
   Next i
   ' Previous hand positions
   PHrX = clockcen: PHrY = 216
   PMnX = clockcen: PMnY = 216
   PScX = clockcen: PScY = 216
   ' Clock display loop
   Do
     ' Wait for a second to elapse
   t$=Time$: Timed = Val(Left$(t$,2)) * 3600 + Val(Mid$(t$,4,2)) * 60 + Val(Right$(t$,2))
   Do
   'Pin 0=0
   Pause 999
   'Pin 0=1
   Loop Until Int(Timer)/1000 <> Timed
     ' Calculate the time values
   T$=Time$:TimeNow = Val(Left$(T$,2)) * 3600 + Val(Mid$(t$,4,2)) * 60 + Val(Right$(t$,2))
   Second = TimeNow Mod 60
   Minute = (TimeNow \ 60) Mod 60
   Minute = Minute + Second \ 60
   Hour = TimeNow / 3600
     If Hour >= 12 Then Hour = Hour - 12
     ' Compute the angles (converted to radians)
     HrAng = .523599 * Hour
     MnAng = .10472 * Minute
     ScAng = .10472 * Second
     ' Compute the hands' endpoints
   HrX = Sin(HrAng) * 120 + clockcen: HrY = 0 - Cos(HrAng) * 120 + clkcenv
   MnX = Sin(MnAng) * 180 + clockcen: MnY = 0 - Cos(MnAng) * 180 + clkcenv
   ScX = Sin(ScAng) * 190 + clockcen: ScY = 0 - Cos(ScAng) * 190 + clkcenv
     ' Erase the previous hands
   Line clockcen,clkcenv,PHrx,PHry,1,backcol
   Line clockcen,clkcenv,PMnx,PMny,1,backcol
   Line clockcen,clkcenv,PScx,PScy,1,backcol
     ' Draw the current hands
   Line clockcen,clkcenv,HrX, HrY,1
   Line clockcen,clkcenv,MnX, MnY,1
   Line clockcen,clkcenv,ScX, ScY,1,RGB(RED)
     ' Save the hands' position
     PHrX = HrX: PHrY = HrY
     PMnX = MnX: PMnY = MnY
     PScX = ScX: PScY = ScY
   key$ = Inkey$
   Loop Until (key$ = Chr$(27) or key$ = Chr$(32))
   IF key$ = Chr$(32) Then Gosub L005 : Cls : Gosub PRTDAY : Goto START
   
   End
L001: 'WeekDay.bas    Ray Thomas      September 2000
   Dim TxtDay$(7)
   Dim TxtMonth$(12)
   Data "Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"
   Data "January","February","March","April","May","June","July"
   Data "August","September","October","November","December"
   For Count = 0 To 6
          Read TxtDay$(Count)
   Next Count
   For Count = 0 To 11
          Read TxtMonth$(Count)
   Next Count
   UserDate$ = Date$
   '*** Split out the day, month and year ***
   Day = Val(Left$(UserDate$, 2))
   Month = Val(Mid$(UserDate$, 4, 2))
   Year = Val(Right$(UserDate$, 4))
   OldYear = Year
   OldMonth=Month
   '*** start the print out
PRTDAY:
   Suffix$ = "th"
   If Day Mod 10 = 1 Then Suffix$ = "st"
   If Day Mod 10 = 2 Then Suffix$ = "nd"
   If Day Mod 10 = 3 Then Suffix$ = "rd"
   If Day > 10 And Day < 14 Then Suffix$ = "th"
   '*** For any date in Jan or Feb add 12 to the month and
   '*** subtract 1 from the year
   If Month < 3 Then
          Month = Month + 12
          Year = Year - 1
   EndIf
   '*** Add 1 to the month and multiply by 2.61
   '*** Drop the fraction (not round) afterwards
   Month = Month + 1
   Month = Fix(Month * 2.61)
   '*** Add Day, Month and the last two digits of the year
   NewYear$ = Str$(Year)
   Year = Val(Right$(NewYear$, 2))
   DMY = Day + Month + Year
   Century = Val(Left$(NewYear$, 2))
   '*** Add a quarter of the last two digits of the year
   '*** (truncated not rounded)
   Year = Fix(Year / 4)
   DMY = DMY + Year
   '*** Add the following factors for the year
   If Century = 18 Then Century = 2
   If Century = 19 Then Century = 0
   If Century = 20 Then Century = 6
   If Century = 21 Then Century = 4
   DMY = DMY + Century
   '*** The day of the week is the modulus of DMY divided by 7
   DMY = DMY Mod 7
   prt$=TxtDay$(DMY)+", "+Str$(Day)+Suffix$+" of "+TxtMonth$(OldMonth-1)+", "+Str$(OldYear)
   'prtlen=Len(prt$)
   Text MM.HRES /2,MM.VRES-68,prt$,"CM",4
   Return
L002: ver$=Str$(MM.INFO(VERSION))
L003: verpos=Instr(ver$,".")
   If verpos = 0 Then ver$=ver$+".0":GoTo L003
   ver1$=Left$(ver$,verpos-1)
   ver2$=Mid$(ver$,verpos+1,2)
   ver3$=Right$(ver$,Len(ver$)-verpos)
   ver4$=Str$(Val(Left$(ver3$,2)))
   If Len(ver3$)>2 Then ver5=Val(Right$(ver3$,2)):vers5$=Chr$(ver5+64)
   version$=ver1$+"."+ver4$+vers5$
   Return
   '***
L004: '*** Subroutine to request and verify the current date and time - Hugh Buckle 12/2011
   Cls
   '*** days in each month
   Dim DaysInMth(12)
   For i = 1 To 12
     Read DaysInMth(i)
   Next
   Return
   '***
L005: '*** Ask if date and time to be entered
   CLS
   Print "System date & time are " Date$ " " Time$
   Input "Do you wish to change them (y/n)"; Reply$
   If LCase$(Reply$) = "n" Then
     Return
   ElseIf LCase$(Reply$) <> "y" Then
     Print " Sorry I didn't understand your reply. Please answer Y or N"
     GoTo L005
   EndIf
   '***
L006: '*** ask for current date
   Input "Enter date dd-mm-yyyy"; reply$
   i = Instr(1,reply$,"-")
   If i > 1 Then
     day = Val(Left$(reply$,i-1))
   Else
     Print "Please use format dd-mm-yy."
     Print
     GoTo L006
   EndIf
   j = Instr(i+1,reply$,"-")
   If j > i + 1 Then
     month = Val(Mid$(reply$,i+1,j-i-1))
     year = Val(Right$(reply$, Len(reply$) - j))
   EndIf
   If Month < 1 Or Month > 12 Then
     Print "Month error. Please use format dd-mm-yyyy"
     Print
     GoTo L006
   EndIf
   If day < 1 Or day > DaysInMth(Month) Then
      Print "Day error. Please use format dd-mm-yyyy"
      Print
      GoTo L006
   EndIf
   '*** leap years are evenly divisible by 4
   '*** however those evenly divisible by 100 are not unless they are evenly divisible by 400
   If month = 2 And day > 28 Then
     If year Mod 4 <> 0 Or year/100 Mod 4 <> 0 Then
       Print year " is not a leap year."
       Print
       GoTo L006
     EndIf
   EndIf
   Date$ = reply$
   '***
L007: '*** Ask for current time
   Input "Enter time hh:mm[:ss] "; reply$
   i  = Instr(1,reply$,":")
   If i > 1 Then
     hour = Val(Left$(reply$,i-1))
   Else
     Print "Please use format hh:mm[:ss]"
     Print
     GoTo L007
   EndIf
   j = Instr(i+1,reply$,":")
   '*** if no second colon then seconds have been omitted
   If j = 0 Then
     minute = Val(Right$(Reply$, Len(reply$) - i))
     second = 0
   Else
     minute = Val(Mid$(reply$,i+1,j-i-1))
     second = Val(Right$(reply$, Len(reply$) - j))
   EndIf
   If hour < 0 Or Hour > 24 Or minute < 0  Or minute > 59 Or second < 0 Or second > 59 Then
     Print "Time error. Please use format hh:mm[:ss] where seconds are optional."
     Print
     GoTo L007
   EndIf
   Time$ = reply$
   Return
   '*** End HB mod 12/2011

