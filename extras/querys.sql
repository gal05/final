use DBESTUDIO2010;


select * from ALUMNOS where codcar = 'C03';


go
create proc listar1
as
select codalu,nomalu, email,telefono,codcar, Year(fecha_ins) as fecha_ins,estado from ALUMNOS 
where Year(fecha_ins)='2005' and codcar='Cy01'

go


select a.nomalu,c.nomcur, n.pp*0.2+n.pt*0.3+n.ex*0.5 as final from NOTAS n inner join ALUMNOS a on n.codalu=a.codalu 
inner join CURSOS c on c.codcur=n.codcur 
where a.nomalu='Valencia salcedo Christian' and c.nomcur='Algoritmica';