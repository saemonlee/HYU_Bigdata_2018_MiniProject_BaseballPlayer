select
	team, team_status.thit, team_status.thr, team_status.tavr, team_status.twalk,
	team_status.tslg, team_status.tops, team_status.twoba, team_status.twrc,
	contact,
	case
		when Contact >= 90 then 'S'
		when Contact >= 70 then 'A'
		when Contact >= 50 then 'B'
		when Contact >= 30 then 'C'
		else 'D'
		end as C_rank,
	tpower,
	case
		when tpower >= 90 then 'S'
		when tpower >= 60 then 'A'
		when tpower >= 40 then 'B'
		when tpower >= 30 then 'C'
		else 'D'
		end as p_rank,
	prod,
	case
		when Prod >= 80 then 'S'
		when Prod >= 60 then 'A'
		when Prod >= 40 then 'B'
		when Prod >= 30 then 'C'
		else 'D'
		end as pr_rank,
	running,
	case
		when Running >= 90 then 'S'
		when Running >= 70 then 'A'
		when Running >= 40 then 'B'
		when Running >= 30 then 'C'
		else 'D'
		end as r_rank,
	sp,
	case
		when SP >= 90 then 'S'
		when SP >= 80 then 'A'
		when SP >= 60 then 'B'
		when SP >= 30 then 'C'
		else 'D'
		end as sp_rank,
	rp,
	case
		when RP >= 90 then 'S'
		when RP >= 70 then 'A'
		when RP >= 30 then 'B'
		when RP >= 15 then 'C'
		else 'D'
		end as rp_rank,
	def,
	case
		when Def >= 90 then 'S'
		when Def >= 70 then 'A'
		when Def >= 50 then 'B'
		when Def >= 30 then 'C'
		else 'D'
		end as d_rank
from (select team,
	thit,
	thr,
	tavr,
	twalk,
	tslg,
	tops,
	twoba,
	twrc,
	round((tavr-0.265)*100000/38) as contact,
	round((tslg+(thr/thit)-0.460)*10000/19) as tpower,
	round((twrc-80)*100/38) as prod,
	round((traa_run+12)*100/23) as running,
	round(abs((tst_era-6.25)*500/11)) as sp,
	round(abs((tre_era-6.05)*500/9)) as rp,
	round(traa_def+60) as def
from tstat) as team_status;
