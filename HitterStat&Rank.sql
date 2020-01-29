select
	c.hname, ss.team, ss.dposition, c.havr, c.risp, c.hhr, c.rbi, c.stl,
	ss.hpower, ss.prank, ss.contact, ss.crank, ss.eyes, ss.erank, ss.running, ss.rrank, ss.speed, ss.srank, ss.def, ss.drank
from hstat_classic c inner join (select
	h.num as num,
	d.team as team,
	d.dposition as dposition,
	case
		when h.at_bat < 100 then 0
		else round(h.isop*250)
	end as hpower,
	case
		when h.at_bat < 100 then '측정불가'
		when round(h.isop*250)>=85 then 'S'
		when round(h.isop*250)>=60 then 'A'
		when round(h.isop*250)>=45 then 'B'
		when round(h.isop*250)>=30 then 'C'
		else 'D'
	end as prank,
	case
		when h.at_bat < 100 then 0
		else round((h.havr-0.15)*10000/22)
	end as contact,
	case
		when h.at_bat < 100 then '측정불가'
		when round((h.havr-0.15)*10000/22)>=95 then 'S'
		when round((h.havr-0.15)*10000/22)>=75 then 'A'
		when round((h.havr-0.15)*10000/22)>=50 then 'B'
		when round((h.havr-0.15)*10000/22)>=30 then 'C'
		else 'D'
	end as crank,
	case
		when h.at_bat < 100 then 0
		else round((h.hwalk-0.2)*400)
		end as eyes,
	case
		when h.at_bat < 100 then '측정불가'
		when round((h.hwalk-0.2)*400)>=92 then 'S'
		when round((h.hwalk-0.2)*400)>=75 then 'A'
		when round((h.hwalk-0.2)*400)>=50 then 'B'
		when round((h.hwalk-0.2)*400)>=35 then 'C'
	else 'D'
	end as erank,
	case
		when h.at_bat < 100 then 0
		else round((h.hraa_run+6)*100/12)
	end as running,
	case
		when h.at_bat < 100 then '측정불가'
		when round((h.hraa_run+6)*100/12)>=80 then 'S'
		when round((h.hraa_run+6)*100/12)>=70 then 'A'
		when round((h.hraa_run+6)*100/12)>=50 then 'B'
		when round((h.hraa_run+6)*100/12)>=35 then 'C'
		else 'D'
	end as rrank,
	case
		when h.at_bat < 100 then 0
		else round(h.spd*100/9)
	end as speed,
	case
		when h.at_bat < 100 then '측정불가'
		when round(h.spd*100/9)>=81 then 'S'
		when round(h.spd*100/9)>=70 then 'A'
		when round(h.spd*100/9)>=50 then 'B'
		when round(h.spd*100/9)>=35 then 'C'
		else 'D'
	end as srank,
	case
		when h.at_bat < 100 then 0
		else round((d.waa_def2+1.2)*1000/23)
	end as def,
	case
		when h.at_bat < 100 then '측정불가'
		when round((d.waa_def2+1.2)*1000/23)>=95 then 'S'
		when round((d.waa_def2+1.2)*1000/23)>=75 then 'A'
		when round((d.waa_def2+1.2)*1000/23)>=50 then 'B'
		when round((d.waa_def2+1.2)*1000/23)>=35 then 'C'
		else 'D'
	end as drank
from hstat_special h inner join player_def d
on h.num = d.num) ss
on c.num = ss.num;
