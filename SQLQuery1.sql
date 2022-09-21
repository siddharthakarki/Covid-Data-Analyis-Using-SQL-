select *
from Portfolio_Project..covidvaccination
order by 3,4

--select * 
--from Portfolio_Project..coviddeaths
--order by 3,4

select location, date, total_cases, new_cases, total_deaths, population
from Portfolio_Project..coviddeaths
order by 1,2

-- Total Cases Vs Total Death in germany
select location, date, total_cases,  total_deaths, (total_deaths/total_cases)*100 as Deathpercentage
from Portfolio_Project..coviddeaths
where location like '%Germany%'
order by 1,2 

--Total population vs Total cases
select location, date, total_cases,   population, (total_cases/population)*100 as Deathpercentage
from Portfolio_Project..coviddeaths
order by 1,2

--Total population vs Total cases in germany
select location, date, total_cases,   population, (total_cases/population)*100 as Deathpercentage
from Portfolio_Project..coviddeaths
where location like '%Germany%'
order by 1,2



--Total population vs Total cases in germany
select location, population,  MAX(total_cases),    MAX((total_cases/population)*100 )as Infectedpercentagepopulation
from Portfolio_Project..coviddeaths
Group by location, population
order by Infectedpercentagepopulation desc

-- Death By Continents 
select location, MAX(cast(total_deaths as int)) as Totaldeathcount_continent
from Portfolio_Project..coviddeaths
where continent is   null
Group by location
order by Totaldeathcount_continent desc

--Countries with highest death count per population
select location,  population , MAX(cast(total_deaths as int)) as Totaldeathcount
from Portfolio_Project..coviddeaths
where continent is not  null
Group by location, population
order by Totaldeathcount desc

--Global Numbers

select date, SUM(new_cases) as totalcases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_cases)*100 as DeathPercentage
from Portfolio_Project..coviddeaths
where continent is not null
Group By date
order by 1,2

--New Vaccination over world
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location, dea.date) as rollingpeoplevaccinated
--,(rollingpeoplevaccination/population)*100
from Portfolio_Project..coviddeaths dea
join Portfolio_Project..covidvaccination vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
order by 2,3
-- we want a rolling count ( can be done using partition by or by windows function)  

--Using CTE
With popvsVac(continent, location, date, population, new_vaccinations, rollingpopulationvaccinated)
as
(select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location, dea.date) as rollingpeoplevaccinated
--,(rollingpeoplevaccination/population)*100
from Portfolio_Project..coviddeaths dea
join Portfolio_Project..covidvaccination vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null 
)
select *, (rollingpopulationvaccinated/population)*100
from popvsvac




--Temp table
Drop table if exists #percentpopulationvaccinated
create table #percentpopulationvaccinated
(
continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccination numeric,
rollingpopulationvaccinated numeric
)
Insert into #percentpopulationvaccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location, dea.date) as rollingpeoplevaccinated
--,(rollingpeoplevaccination/population)*100
from Portfolio_Project..coviddeaths dea
join Portfolio_Project..covidvaccination vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null 

select *, (rollingpopulationvaccinated/population)*100
from #percentpopulationvaccinated




 --creating view to store data

 create view percentpopulationvaccinationes as
 select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(cast(vac.new_vaccinations as int)) OVER (Partition by dea.location Order by dea.location, dea.date) as rollingpeoplevaccinated
--,(rollingpeoplevaccination/population)*100
from Portfolio_Project..coviddeaths dea
join Portfolio_Project..covidvaccination vac
on dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null 

select *
from percentpopulationvaccinated
