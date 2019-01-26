use master;
go
--after creating database once uncomment alter statement
alter database Fortnite set single_user with rollback immediate
go
drop database if exists Fortnite;
go
create database Fortnite;
go
use Fortnite;
go
--after this create your tables
drop table if exists stats
go
drop table if exists weapons;
go

create table Weapons(
ID int not null primary key identity(1,1),
Type nvarchar(20),
Name nvarchar(30),
Rarity nvarchar(20),
Damage decimal(5,1),
FireRate decimal(5,1),
MagazineSize decimal(5,1),
ReloadTime decimal(5,1),
DPS decimal(5,1),
BulletType nvarchar(20),
VaultedStatus bit not null default 0,
VaultedPatch nvarchar(10) not null default 'Current'
);
go

insert into Weapons
(Type,Name,Rarity,Damage,FireRate,MagazineSize,ReloadTime,DPS,BulletType)
values
('Pistol','Scoped Revolver','Legendary',44,1.6,6,2,70.4,'Medium'),
('Pistol','Hand Cannon','Legendary',78,0.8,7,2,62.4,'Heavy'),
('Shotgun','Heavy Shotgun','Legendary',77,1,7,5.6,77,'Shells ''n'' Slugs'),
('Shotgun','Pump Shotgun','Legendary',116,0.7,5,4,81.2,'Shells ''n'' Slugs'),
('SMG','Compact SMG', 'Legendary',21,10,40,3,210,'Light'),
('Assault','Assault Rifle','Legendary',36,5.5,30,2.1,198,'Medium'),
('Assault','Heavy Assault Rifle','Legendary',48,3.75,25,2.,180,'Medium'),
('Assault','Burst Assault Rifle','Legendary',33,1.75,30,2.3,57.8,'Medium'),
('Assault','Suppressed Assault Rifle','Legendary',33,5.5,30,2.1,181.5,'Medium'),
('Assault','Thermal Scoped Assault Rifle','Legendary',37,1.8,15,2.1,66.6,'Medium'),
('Sniper','Heavy Sniper Rifle','Legendary',157,0.33,1,4.1,51.8,'Heavy'),
('Sniper','Suppressed Sniper Rifle','Legendary',105,0.33,1,2.7,34.7,'Heavy'),
('Minigun','Minigun','Legendary',19,12,999,4.5,228,'Light'),
('Explosive','Grenade Launcher','Legendary',110,1,6,2.7,110,'Rockets'),
('Explosive','Rocket Launcher','Legendary',121,0.75,1,2.5,90.8,'Rockets'),
('Pistol','Scoped Revolver','Epic',42,1.6,6,2.1,67.2,'Medium'),
('Pistol','Hand Cannon','Epic',75,0.8,7,2.1,60,'Heavy'),
('Pistol','Suppressed Pistol','Epic',28,6.75,16,1.3,189,'Light'),
('Pistol','Dual Pistols','Epic',43,2.2,18,2.7,94.6,'Medium'),
('Shotgun','Heavy Shotgun','Epic',74,1,7,5.9,74,'Shells ''n'' Slugs'),
('Shotgun','Pump Shotgun','Epic',110,0.7,5,4.2,77,'Shells ''n'' Slugs'),
('SMG','Compact SMG', 'Epic',20,10,40,3.1,200,'Light'),
('Assault','Assault Rifle','Epic',35,2.1,30,2.1,192.5,'Medium'),
('Assault','Heavy Assault Rifle','Epic',44,3.75,25,2.7,172.5,'Medium'),
('Assault','Burst Assault Rifle','Epic',32,1.75,30,2.5,56,'Medium'),
('Assault','Suppressed Assault Rifle','Epic',32,5.5,30,2.2,176,'Medium'),
('Assault','Thermal Scoped Assault Rifle','Epic',36,1.8,15,2.2,64.8,'Medium'),
('Sniper','Bolt-Action Sniper Rife','Epic',110,0.33,1,2.8,110,'Heavy'),
('Sniper','Heavy Sniper Rifle','Epic',150,0.33,1,4.3,49.5,'Heavy'),
('Sniper','Suppressed Sniper Rifle','Epic',100,0.33,1,2.8,33,'Heavy'),
('Minigun','Minigun','Epic',18,12,999,4.8,216,'Light'),
('Explosive','Grenade Launcher','Epic',105,1,6,2.8,105,'Rockets'),
('Explosive','Rocket Launcher','Epic',116,0.75,1,2.7,87,'Rockets'),
('Crossbow','Fiend Hunter Crossbow','Epic',40,1.8,7,2.5,72,'Arrows'),
('Pistol','Suppressed Pistol','Rare',26,6.75,16,1.3,175.5,'Light'),
('Pistol','Dual Pistols','Rare',41,2.2,18,2.8,90.2,'Medium'),
('Shotgun','Tactical Shotgun','Rare',70,1.5,8,6,105,'Shells ''n'' Slugs'),
('Shotgun','Pump Shotgun','Rare',105,0.7,5,4.4,73.5,'Shells ''n'' Slugs'),
('SMG','Submachine Gun', 'Rare',19,12,30,2.2,228,'Light'),
('Assault','Assault Rifle','Rare',33,5.5,30,2.2,181.5,'Medium'),
('Assault','Heavy Assault Rifle','Rare',44,3.75,25,2.8,165,'Medium'),
('Assault','Scoped Assault Rifle','Rare',24,3.5,20,2.2,84,'Medium'),
('Sniper','Hunting Rifle','Rare',90,0.8,1,1.8,72,'Heavy'),
('Sniper','Bolt-Action Sniper Rife','Rare',105,0.33,1,3,105,'Heavy'),
('Explosive','Grenade Launcher','Rare',100,1,6,3,100,'Rockets'),
('Shotgun','Tactical Shotgun','Uncommon',67,1.5,8,6.3,100.5,'Shells ''n'' Slugs'),
('Shotgun','Pump Shotgun','Uncommon',100,0.7,5,4.6,70,'Shells ''n'' Slugs'),
('SMG','Submachine Gun', 'Uncommon',18,12,30,2.3,216,'Light'),
('Assault','Assault Rifle','Uncommon',31,5.5,30,2.2,170.5,'Medium'),
('Assault','Scoped Assault Rifle','Uncommon',23,3.5,20,2.3,80.5,'Medium'),
('Sniper','Hunting Rifle','Uncommon',86,0.8,1,1.9,68.8,'Heavy'),
('Shotgun','Tactical Shotgun','Common',67,1.5,8,6.3,100.5,'Shells ''n'' Slugs'),
('SMG','Submachine Gun', 'Common',17,1.2,30,2.4,204,'Light'),
('Assault','Assault Rifle','Common',30,5.5,30,2.3,165,'Medium'),
('Pistol','Pistol','Common',23,6.75,16,1.5,155.2,'Light'),
('Pistol','Pistol','Uncommon',24,6.75,16,1.5,162,'Light')

go

insert into Weapons
(Type,Name,Rarity,BulletType,VaultedStatus,VaultedPatch)
values
('Pistol','Revolver','Common','Medium',1,'5.40'),
('Pistol','Revolver','Uncommon','Medium',1,'5.40'),
('Pistol','Revolver','Rare','Medium',1,'5.40'),
('Sniper','Zapotron','Legendary','Energy Cells',1,'1.64'),
('Crossbow','Crossbow','Epic','Arrows',1,'4.0'),
('Crossbow','Crossbow','Rare','Arrows',1,'4.0'),
('Assault','Burst Assault Rifle','Common','Medium',1,'7.10'),
('Assault','Burst Assault Rifle','Uncommon','Medium',1,'7.10'),
('Assault','Burst Assault Rifle','Rare','Medium',1,'7.10'),
('Shotgun','Double Barrel Shotgun','Legendary','Shells ''n'' Slugs',1,'7.00'),
('Shotgun','Double Barrel Shotgun','Epic','Shells ''n'' Slugs',1,'7.00'),
('Shotgun','Tactical Shotgun','Epic','Shells ''n'' Slugs',1,'Unknown'),
('SMG','Drum Gun','Rare','Medium',1,'5.40'),
('SMG','Drum Gun','Uncommon','Medium',1,'5.40'),
('Machine Gun','Light Machine Gun','Epic','Medium',1,'6.00'),
('Machine Gun','Light Machine Gun','Rare','Medium',1,'6.00'),
('Sniper','Semi-Auto Sniper Rifle','Rare','Heavy',1,'6.21'),
('Sniper','Semi-Auto Sniper Rifle','Uncommon','Heavy',1,'6.21'),
('Sniper','Semi-Auto Sniper Rifle','Legendary','Heavy',1,'5.40'),
('Pistol','Six Shooter','Epic','Medium',1,'7.10'),
('Pistol','Six Shooter','Rare','Medium',1,'7.10'),
('Pistol','Six Shooter','Uncommon','Medium',1,'7.10'),
('SMG','Suppressed Submachine Gun', 'Rare','Light',1,'6.00'),
('SMG','Suppressed Submachine Gun', 'Uncommon','Light',1,'6.00'),
('SMG','Suppressed Submachine Gun', 'Common','Light',1,'6.00'),
('SMG','Tactical Submachine Gun', 'Epic','Light',1,'5.00'),
('SMG','Tactical Submachine Gun', 'Rare','Light',1,'5.00'),
('SMG','Tactical Submachine Gun', 'Uncommon','Light',1,'5.00'),
('Pistol','Pistol','Rare','Light',1,'5.40'),
('Explosive','Rocket Launcher','Rare','Rockets',1,'5.40'),
('Explosive','Guided Missile','Legendary','Rockets',1,'6.21'),
('Explosive','Guided Missile','Epic','Rockets',1,'6.21'),
('Explosive','Quad Launcher','Legendary','Rockets',1,'7.20'),
('Explosive','Quad Launcher','Epic','Rockets',1,'7.20'),
('Melee','Infinity Blade','Mythic','NONE',1,'7.10')

select * from Weapons
go

/*--create table of stats here, add then add its fk to weapons
Damage,DamageHead,FireRate,MagazineSize,ReloadTime,DPS,StructureDamage
create table Stats(
ID int not null primary key identity(1,1),
WeaponsID int foreign key references weapons(Id),

Damage decimal(5,1),
DamageHead decimal(5,1),
FireRate decimal(5,1),
MagazineSize decimal(5,1),
ReloadTime decimal(5,1),
DPS decimal(5,1),
StructureDamage decimal(5,1),

--FSA bit not null default is
);
*/





/*
Tester decimal(5,2)

insert into Weapons
(Name,Tester)
values
('test',23.23)


for special stats table
DamageHead,
StructureDamage,


Damage,DamageHead,FireRate,MagazineSize,ReloadTime,DPS,StructureDamage

*/