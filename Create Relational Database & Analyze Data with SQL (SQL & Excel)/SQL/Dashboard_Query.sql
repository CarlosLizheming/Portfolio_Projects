Use FIFAWorldCupTest
GO
----------------------------------Data Preparation-----------------------------------
---Insert Data for 2018
Select * From World_Cup
GO
Insert into World_Cup(Year,Host_Country_ID,Winner_Country_ID,RunnersUp_Country_ID,Third_Country_ID,Fourth_Country_ID) Values
(2018,'RUS','FRA','CRO','BEL','ENG')
GO
Delete World_Cup
Where Year=2018
GO

Select Country_ID,Country_Name From Country
Where Country_Name in ('Russia','France','Croatia','Belgium','England')
GO
---Date Cleaning
Select * From Match_Info
Where Stage like '%third%'
GO
Update Match_Info
Set Stage='Match for third place'
Where Stage like '%third%'
GO
Select * From Country
Where Country_Name like '%China%'
GO
Update Country
Set Country_Name='China'
Where Country_ID='CHN'
GO
Select * From Country
Where Country_Name like '%Korea%'
GO
Update Country
Set Country_Name='Korea'
Where Country_ID='KOR'
GO

---------------------------------------Dash Board Query-------------------------------
Select * From World_Cup
Order by Host_Country_ID
GO

--About World Cup
-----Q1. How many times has FIFA World Cup been hosted Sucessfully?
-----A1.20 Times.
Create view Total_Host_Times as
Select Count(Distinct Year) as Total_Host_Times
From World_Cup
GO
Select * From Total_Host_Times
GO
-----Q2.How many Countries has been qualified FIFA World Cup in history?
-----A2.82 Countries in history.
Create View  Qualified_Country as 
Select Distinct Home_Team as Qualified_Country_ID From Match_Score
Union
Select Distinct Away_Team as Qualified_Country_ID  From Match_Score
GO
Select Count(Qualified_Country_ID ) as 'Number_of Qualified_Countries' From Qualified_Country
GO

Create View Qualified_Country_List as
With QTE as (Select Year,Home_Team as Team
From (Match_Info Join Match_Score
ON Match_Info.Match_ID=Match_Score.Match_ID)
Union
Select Year,Away_Team as Team
From (Match_Info Join Match_Score
ON Match_Info.Match_ID=Match_Score.Match_ID))
Select Country.Country_Name,Count(QTE.Year) as Qualified_Times
From
QTE Left Join Country
On QTE.Team=Country.Country_ID
Group By Country.Country_Name
GO
Select * From Qualified_Country_List
Order by Qualified_Times DESC
GO

Create View Host_or_Not as
Select C.Country_ID,Q.Country_Name,Q.Qualified_Times,
Case
When W.Host_Country_ID is not null Then 'Y'
Else 'N'
End as Host_or_Not
From
Qualified_Country_List Q Left Join Country C
On Q.Country_Name=C.Country_Name
Left Join World_Cup W
On C.Country_ID=W.Host_Country_ID
GO

Select * From Host_or_Not
Order by Qualified_Times DESC
GO
-----Q3.How many teams in each World Cup?
-----A3.
With Teams as (
Select Year,Home_Team as Team
From (Match_Info Join Match_Score
ON Match_Info.Match_ID=Match_Score.Match_ID)
Union
Select Year,Away_Team as Team
From (Match_Info Join Match_Score
ON Match_Info.Match_ID=Match_Score.Match_ID)
)
Select Year,Count(Team) as Number_of_Teams
From Teams
Group by Year
GO
---Q.4 List of Qualified Team in each World Cup
---A.4
Create View List_of_Qualified_Team_each_worldcup as 
Select Year,Home_Team as Team
From (Match_Info Join Match_Score
ON Match_Info.Match_ID=Match_Score.Match_ID)
Union
Select Year,Away_Team as Team
From (Match_Info Join Match_Score
ON Match_Info.Match_ID=Match_Score.Match_ID)
GO
Select * From List_of_Qualified_Team_each_worldcup
GO


--Host Country
-----Q1.What are the Host Countries? How many Times has they hosted?
-----Japan/Korea host 2002 Jointly
Select * From World_Cup
GO
Select * From Country
Where Country_Name like '%German%'
GO
Update World_Cup
Set Host_Country_ID='FRG'
Where Year=1974
GO
Create View List_of_Host as
Select Country.Country_Name,Count(World_Cup.[Year]) as [Host_Times]
From World_Cup join Country
On World_Cup.Host_Country_ID=Country.Country_ID
Group By Country_Name
GO
Select * From List_of_Host
Order by Host_Times DESC
GO
-----Q2.How far did Host Countries go?
-----A2.
Select 
World_Cup.Year,World_Cup.Host_Country_ID,
Match_Info.Match_ID,Match_Info.Stage,Match_Info.Date,Match_Info.Time,
Match_Score.Home_Team,Match_Score.Home_Team_Goals,Match_Score.Away_Team,Match_Score.Away_Team_Goals
From (Match_Info Join Match_Score
ON Match_Info.Match_ID=Match_Score.Match_ID
Left Join World_Cup
On Match_Info.Year=World_Cup.Year)
Where World_Cup.Host_Country_ID=Match_Score.Home_Team
Or World_Cup.Host_Country_ID=Match_Score.Away_Team
Order by Match_Info.Date
GO

With Last_match as (
Select 
World_Cup.Year,
Max(Match_Info.Date) as Last_match_Date
From (Match_Info Join Match_Score
ON Match_Info.Match_ID=Match_Score.Match_ID
Left Join World_Cup
On Match_Info.Year=World_Cup.Year)
Where World_Cup.Host_Country_ID=Match_Score.Home_Team
Or World_Cup.Host_Country_ID=Match_Score.Away_Team
Group by World_Cup.Year
)
Select 
World_Cup.Year,World_Cup.Host_Country_ID,
Match_Info.Match_ID,Match_Info.Stage,Match_Info.Date,Match_Info.Time,
Match_Score.Home_Team,Match_Score.Home_Team_Goals,Match_Score.Away_Team,Match_Score.Away_Team_Goals
From (Match_Info Join Match_Score
ON Match_Info.Match_ID=Match_Score.Match_ID
Left Join World_Cup
On Match_Info.Year=World_Cup.Year)
Left Join Last_match
On World_Cup.Year=Last_match.Year
Where (World_Cup.Host_Country_ID=Match_Score.Home_Team
Or World_Cup.Host_Country_ID=Match_Score.Away_Team)
And Match_Info.Date=Last_match.Last_match_Date
Order by Match_Info.Date
GO

Create View Host_Result as
With Last_match as (
Select 
World_Cup.Year,
Max(Match_Info.Date) as Last_match_Date
From (Match_Info Join Match_Score
ON Match_Info.Match_ID=Match_Score.Match_ID
Left Join World_Cup
On Match_Info.Year=World_Cup.Year)
Where World_Cup.Host_Country_ID=Match_Score.Home_Team
Or World_Cup.Host_Country_ID=Match_Score.Away_Team
Group by World_Cup.Year
)
Select 
World_Cup.Year,World_Cup.Host_Country_ID,
Match_Info.Match_ID,Match_Info.Stage,Match_Info.Date,Match_Info.Time,
Match_Score.Home_Team,Match_Score.Home_Team_Goals,Match_Score.Away_Team,Match_Score.Away_Team_Goals
From (Match_Info Join Match_Score
ON Match_Info.Match_ID=Match_Score.Match_ID
Left Join World_Cup
On Match_Info.Year=World_Cup.Year)
Left Join Last_match
On World_Cup.Year=Last_match.Year
Where (World_Cup.Host_Country_ID=Match_Score.Home_Team
Or World_Cup.Host_Country_ID=Match_Score.Away_Team)
And Match_Info.Date=Last_match.Last_match_Date
GO

Select *,Case
When Stage='Final' Then 2
When Stage='Quarter-finals' Then 8
When Stage='Round of 16' Then 16
When Stage like '%third%' Then 4
When Stage like '%Group%' Then 32
End as Result
From Host_Result
Order by Year
GO
--Qualified Teams 1986-2014
-----Q.1 What's the Performance of All Qualified Teams in history?
-----A.1 

Create View Last_Game_Each_Worldcup_Each_Team as 
With Last_Game_Home_Away as (
Select 
Match_Info.Year,
Match_Score.Home_Team as Team,
Max(Match_Info.Date) as Last_Game_this_Year
From (Match_Info Join Match_Score
ON Match_Info.Match_ID=Match_Score.Match_ID)
Group by Match_Info.Year,Match_Score.Home_Team
Union
Select 
Match_Info.Year,
Match_Score.Away_Team as Team,
Max(Match_Info.Date) as Last_Game_this_Year
From (Match_Info Join Match_Score
ON Match_Info.Match_ID=Match_Score.Match_ID)
Group by Match_Info.Year,Match_Score.Away_Team
)
Select Year,Team,Max(Last_Game_this_Year) as Last_Game_this_Year
From Last_Game_Home_Away
Group by Last_Game_Home_Away.Year,Last_Game_Home_Away.Team
GO

Select * From Last_Game_Each_Worldcup_Each_Team
Order by Last_Game_this_Year
GO

Create View Performance_of_Each_Team_from_1986 as Select
Match_Info.Year,
Last_Game_Each_Worldcup_Each_Team.Team,
Match_Info.Date,
Match_Info.Stage,
Match_Score.Home_Team,Match_Score.Home_Team_Goals,Match_Score.Away_Team,Match_Score.Away_Team_Goals
From
Match_Info Join Match_Score
On Match_Info.Match_ID=Match_Score.Match_ID
Join Last_Game_Each_Worldcup_Each_Team
On (
Match_Info.Date=Last_Game_Each_Worldcup_Each_Team.Last_Game_this_Year
And (Match_Score.Home_Team=Last_Game_Each_Worldcup_Each_Team.Team or Match_Score.Away_Team=Last_Game_Each_Worldcup_Each_Team.Team)
)
Where Match_Info.Year>1982
GO

 
Select *,Case
When Stage='Final' Then 2
When Stage like '%third%' Then 4
When Stage='Quarter-finals' Then 8
When Stage='Round of 16' Then 16
When (Stage like '%Group%' And Year<1998)Then 24
When (Stage like '%Group%' And Year>=1998)Then 32
End as Result
From Performance_of_Each_Team_from_1986
Order by Team,Date
GO

Select * From Country
Where Country_Name like'%German%'
GO
-----Q.2 What is the Score distribution?
-----A.2
Create View Score_1986_2014 as
Select Year,Stage,
Home_Team_Goals,
Away_Team_Goals,
Concat(Convert(varchar(5),Home_Team_Goals),'-',Convert(varchar(5),Away_Team_Goals)) as Score
From
Match_Info join Match_Score
On Match_Info.Match_ID=Match_Score.Match_ID
Where Year>1982
GO
Select * From Score_1986_2014
GO



Select Score,Count(*) as distribution,
Case
When (Score='0-1' or Score='1-0') Then '0-1'
When (Score='0-2' or Score='2-0') Then '0-2'
When (Score='0-3' or Score='3-0') Then '0-3'
When (Score='0-4' or Score='4-0') Then '0-4'
When (Score='0-5' or Score='5-0') Then '0-5'
When (Score='0-6' or Score='6-0') Then '0-6'
When (Score='0-7' or Score='7-0') Then '0-7'
When (Score='0-8' or Score='8-0') Then '0-8'
When (Score='1-2' or Score='2-1') Then '1-2'
When (Score='1-3' or Score='3-1') Then '1-3'
When (Score='1-4' or Score='4-1') Then '1-4'
When (Score='1-5' or Score='5-1') Then '1-5'
When (Score='1-6' or Score='6-1') Then '1-6'
When (Score='1-7' or Score='7-1') Then '1-7'
When (Score='2-3' or Score='3-2') Then '2-3'
When (Score='2-4' or Score='4-2') Then '2-4'
When (Score='2-5' or Score='5-2') Then '2-5'
When (Score='3-4' or Score='4-3') Then '3-4'
Else Score
End as SScore
From Score_1986_2014
Group by Score
GO

Select Year,Case
When Stage like '%Group%' Then 'Group'
Else Stage
End as CCase
,Home_Team_Goals,Away_Team_Goals,
Case
When (Score='0-1' or Score='1-0') Then '0-1'
When (Score='0-2' or Score='2-0') Then '0-2'
When (Score='0-3' or Score='3-0') Then '0-3'
When (Score='0-4' or Score='4-0') Then '0-4'
When (Score='0-5' or Score='5-0') Then '0-5'
When (Score='0-6' or Score='6-0') Then '0-6'
When (Score='0-7' or Score='7-0') Then '0-7'
When (Score='0-8' or Score='8-0') Then '0-8'
When (Score='1-2' or Score='2-1') Then '1-2'
When (Score='1-3' or Score='3-1') Then '1-3'
When (Score='1-4' or Score='4-1') Then '1-4'
When (Score='1-5' or Score='5-1') Then '1-5'
When (Score='1-6' or Score='6-1') Then '1-6'
When (Score='1-7' or Score='7-1') Then '1-7'
When (Score='2-3' or Score='3-2') Then '2-3'
When (Score='2-4' or Score='4-2') Then '2-4'
When (Score='2-5' or Score='5-2') Then '2-5'
When (Score='3-4' or Score='4-3') Then '3-4'
Else Score
End as SScore
From Score_1986_2014
GO

--Champion
-----Q.1 Who are the Champions
Select C.Country_Name,Count(W.Year) as Times
From World_Cup W Left Join Country C
On W.Winner_Country_ID=C.Country_ID
Group by Country_Name
Order by Times DESC
GO

Select * From Country
Where Country_Name Like '%German%'
GO

Select * From World_Cup
GO