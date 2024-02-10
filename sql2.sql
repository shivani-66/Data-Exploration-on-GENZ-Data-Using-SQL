
/*DATA EXPLORATION*/

select * from learning_aspirations;
select * from manager_aspirations;
select * from mission_aspirations;
select * from personalized_info;

/*1.query : What percentage of Total genz want to go office everyday ? */
select PreferredWorkingEnvironment,count(PreferredWorkingEnvironment) as total , count(PreferredWorkingEnvironment)*100.0/(select count(*) from learning_aspirations) as total_percentage 
from  learning_aspirations 
where PreferredWorkingEnvironment = 'Every Day Office Environment'
Group by PreferredWorkingEnvironment;

/*queery 2 : What percentage of Genz's who have chosen their career in Business operations are most likely to be influenced by their Parents? */
select CareerInfluenceFactor,count(CareerInfluenceFactor) as total , count(CareerInfluenceFactor)*100.0/(select count(*) from learning_aspirations) as total_percentage 
from  learning_aspirations 
where CareerInfluenceFactor = 'My Parents'
Group by CareerInfluenceFactor;

/*query3 : What percentage of Genz prefer opting for higher studies, give a gender wise approach?*/
select l.HigherEducationAbroad,count(l.HigherEducationAbroad) as total , count(l.HigherEducationAbroad)*100.0/(select count(*) from learning_aspirations) as total_percentage , p.Gender
from  learning_aspirations l
join personalized_info p
on l.ResponseID = p.ResponseID
where l.HigherEducationAbroad = 'Yes, I wil'
Group by l.HigherEducationAbroad,p.Gender;

/*query4 : What percentage of Genz are willing & not willing to work for a company whose mission is misaligned with their public actions or even their products ? */
select m.MisalignedMissionLikelihood,count(m.MisalignedMissionLikelihood) as total , count(m.MisalignedMissionLikelihood)*100.0/(select count(*) from mission_aspirations) as total_percentage , p.Gender
from  mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
Group by m.MisalignedMissionLikelihood,p.Gender;

/*query5 :What is the most suitable working environment according to female and male  genz's?  */
select l.PreferredWorkingEnvironment,count(l.PreferredWorkingEnvironment) as total , count(l.PreferredWorkingEnvironment)*100.0/(select count(*) from learning_aspirations) as total_percentage ,p.Gender
from  learning_aspirations l
join personalized_info p
on l.ResponseID = p.ResponseID
Group by l.PreferredWorkingEnvironment,p.Gender
order by total desc ;

/*query6 : Determine the percentage of gender who have a No Social Impact Likelihood of "8 to 10" among those who are interested in Higher Education Abroad */
select m.NoSocialImpactLikelihood,count(NoSocialImpactLikelihood) as total , count(NoSocialImpactLikelihood)*100.0/(select count(*) from mission_aspirations) as total_percentage,p.Gender
from  mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
where m.NoSocialImpactLikelihood < 8
Group by m.NoSocialImpactLikelihood,p.Gender;


/*query7 : Give a detailed breakdown of "WorkLikelihood3 Years" for each gender*/
select m.WorkLikelihood3Years ,p.Gender from manager_aspirations m 
join personalized_info p
on m.ResponseID =p.ResponseID
group by m.WorkLikelihood3Years,p.Gender;


/*query8 : Give a detailed breakdown of "WorkLikelihood3 Years" for each Country */
select m.WorkLikelihood3Years ,p.CurrentCountry from manager_aspirations m 
join personalized_info p
on m.ResponseID =p.ResponseID
group by m.WorkLikelihood3Years,p.CurrentCountry;

/*query9 : What is the Average Starting salary expectations at 3 year mark for each gender */
select avg(m.ExpectedSalary3Years) as AveragesalaryExpectations3years ,p.Gender from mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
group by p.Gender
limit 3;

/*query10 : What is the Average Starting salary expectations at 5 year mark for each gender */
select avg(m.ExpectedSalary5Years) as AveragesalaryExpectations5years,p.Gender from mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
group by p.Gender
limit 3;


/*query11 : What is the Average Higher Bar salary expectations at 3 year mark for each gender   */
select avg(m.ExpectedSalary3Years) as average,p.Gender from mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
group by p.Gender
order by average desc;

/*query12: What is the Average Higher Bar salary expectations at 5 year mark for each gender */
select avg(m.ExpectedSalary5Years) as average,p.Gender from mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
group by p.Gender
order by average desc;

/*query13 : What is the Average Starting salary expectations at 3 year mark for each gender and each country in world */
select avg(m.ExpectedSalary3Years) as avgstartingsalary ,p.Gender,p.CurrentCountry from mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
group by p.Gender,p.CurrentCountry;

/*query14 : What is the Average Starting salary expectations at 5 year mark for each gender and each country in world*/
select avg(m.ExpectedSalary5Years) as avgstartingsalary,p.Gender,p.CurrentCountry from mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
group by p.Gender,p.CurrentCountry;

/*query15: What is the Average Higher Bar salary expectations at 3 year mark for each gender and country*/
select avg(m.ExpectedSalary3Years) as Expectedaverage,p.Gender,p.CurrentCountry from mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
group by p.Gender,p.CurrentCountry
order by Expectedaverage desc;

/*query16: 18. What is the Average Higher Bar salary expectations at 5 year mark for each gender and country*/
select avg(m.ExpectedSalary5Years) as Expectedaverage,p.Gender,p.CurrentCountry from mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
group by p.Gender,p.CurrentCountry
order by Expectedaverage desc;

/*query17 : Give a detailed breakdown of the possibility of GenZ working for an Org if the "Mission is misaligned" for each state in India*/
select m.MisalignedMissionLikelihood,count(m.MisalignedMissionLikelihood) as total , count(m.MisalignedMissionLikelihood)*100.0/(select count(*) from mission_aspirations) as total_percentage , p.Gender , p.CurrentCountry
from  mission_aspirations m
join personalized_info p
on m.ResponseID = p.ResponseID
where m.MisalignedMissionLikelihood = 'Will work for them' 
Group by m.MisalignedMissionLikelihood,p.Gender,p.CurrentCountry;