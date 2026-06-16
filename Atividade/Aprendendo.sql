Create database Atividade;
use Atividade;

create table Cursos (
id int auto_increment primary key,
nome Varchar(250)
);

create table Alunos (
id int auto_increment primary key,
nome varchar(250),
Curso int,
Salario Double,
idade int,
foreign key (Curso) references Cursos(id)
);

Insert Into Cursos (nome) Values ('Matemática'), ('Física'), ('Química');

Insert Into Alunos (nome, Curso, Salario, idade) Values
('Heitor Menezes' , 1, 1000.00, 16),
('Lucas Silvério' , 2, 2000.00, 15);

select
Alunos.id as AlunoID,
Alunos.nome as AlunoNome,
Cursos.nome as CursoNome,
Alunos.Salario,
Alunos.idade
from
Alunos
Join
Cursos On Alunos.Curso = Cursos.id;
