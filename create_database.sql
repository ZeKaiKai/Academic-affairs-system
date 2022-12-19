set sql_mode ='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';  
drop database school_ena;
CREATE DATABASE school_ena CHARACTER SET utf8;
USE school_ena;

drop procedure if exists getFailStuByCourseId;

DROP TABLE IF EXISTS Teacher_full_info;

DROP TABLE IF EXISTS Student_full_info;

DROP TABLE IF EXISTS Course_top1;

DROP TABLE IF EXISTS Course_select_num;

DROP TABLE IF EXISTS Class_top1;

DROP TABLE IF EXISTS Class_select_num2;

drop table if exists Class;

drop table if exists Course;

drop table if exists CourseTeacher;

drop table if exists Department;

drop table if exists Student;

drop table if exists StudentGrade;

drop table if exists Teacher;

drop table if exists User;

/*==============================================================*/
/* Table: Class                                                 */
/*==============================================================*/
create table Class
(
   Class_id             varchar(6) not null,
   Director             varchar(4),
   Depar_id             varchar(2),
   Monitor              varchar(9),
   Class_name           varchar(20) not null,
   Class_number         int,
   primary key (Class_id)
);

/*==============================================================*/
/* Table: Course                                                */
/*==============================================================*/
create table Course
(
   Course_id            varchar(4) not null,
   Course_name          varchar(20) not null,
   Course_hour          smallint not null,
   Introduce            varchar(200),
   primary key (Course_id)
);

/*==============================================================*/
/* Table: CourseTeacher                                         */
/*==============================================================*/
create table CourseTeacher
(
   Course_id            varchar(4) not null,
   Class_id             varchar(6) not null,
   Teac_id              varchar(4) not null,
   primary key (Course_id, Class_id, Teac_id)
);

/*==============================================================*/
/* Table: Department                                            */
/*==============================================================*/
create table Department
(
   Depar_id             varchar(2) not null,
   Depar_name           varchar(50) not null,
   Depar_phone          varchar(8),
   Depar_number         int,
   primary key (Depar_id),
   check (Depar_phone LIKE '3935[0-9][0-9][0-9][0-9]')
);

/*==============================================================*/
/* Table: Student                                               */
/*==============================================================*/
create table Student
(
   Stu_id               varchar(9) not null,
   Stu_name             varchar(8) not null,
   Stu_sex              varchar(2) not null,
   Birthday             date not null,
   Phone                varchar(15),
   Address              varchar(100),
   Class_id             varchar(6),
   Score_avg            int,
   primary key (Stu_id),
   check (Phone LIKE '^[1]([3-9])[0-9]{9}$')
);

/*==============================================================*/
/* Table: StudentGrade                                          */
/*==============================================================*/
create table StudentGrade
(
   Stu_id               varchar(9) not null,
   Course_id            varchar(4) not null,
   Grade                smallint,
   primary key (Stu_id, Course_id)
);

/*==============================================================*/
/* Table: Teacher                                               */
/*==============================================================*/
create table Teacher
(
   Teac_id              varchar(4) not null,
   Teac_name            varchar(8) not null,
   Teac_sex             varchar(2),
   Birthday             date,
   TechPost             varchar(10),
   Depar_id             varchar(2),
   Teac_phone           varchar(11),
   Salary               int,
   primary key (Teac_id),
   check (Teac_phone LIKE '^[1]([3-9])[0-9]{9}$')
);

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   User_id              varchar(9) not null,
   Password             varchar(20) not null,
   Power                int not null,
   primary key (User_id)
);

/*==============================================================*/
/* View: Class_select_num2                                      */
/*==============================================================*/
CREATE VIEW  Class_select_num2 AS select Student.Class_id, Class_name,COUNT(Student.Stu_id) as Stu_num
                                  from Student, Class
                                  where Student.Class_id = Class.Class_id
                                  group by Student.Class_id,Class_name;

/*==============================================================*/
/* View: Class_top1                                             */
/*==============================================================*/
CREATE VIEW  Class_top1 AS select Class.Class_id, Class.Class_name, MAX(avg_grade.avg_grade) as max_avg_grade
                           from StudentGrade, Class, Student,
                           	(select Student.Stu_id, avg(Grade) as avg_grade
                           	 from Student, StudentGrade
                           	 where StudentGrade.Stu_id = Student.Stu_id
                           	 group by Student.Stu_id) as avg_grade
                           where StudentGrade.Stu_id = Student.Stu_id
                           and Student.Stu_id = avg_grade.Stu_id
                           and Class.Class_id = Student.Class_id
                           group by Class.Class_id, Class.Class_name;

/*==============================================================*/
/* View: Course_select_num                                      */
/*==============================================================*/
CREATE VIEW  Course_select_num AS select
                                     StudentGrade.Course_id,
                                     Course_name,
                                     COUNT(Student.Stu_id) as Stu_num
                                  from
                                     Student,
                                     StudentGrade,
                                     Course
                                  where
                                     StudentGrade.Course_id = Course.Course_id
                                     and Student.Stu_id = StudentGrade.Stu_id
                                  group by
                                     StudentGrade.Course_id,
                                     Course_name;

/*==============================================================*/
/* View: Course_top1                                            */
/*==============================================================*/
CREATE VIEW  Course_top1 AS select Course.Course_id, Course.Course_name, max(Grade) as max_grade
                            from StudentGrade, Course
                            group by Course.Course_id, Course.Course_name;

/*==============================================================*/
/* View: Student_full_info                                      */
/*==============================================================*/
CREATE VIEW  Student_full_info AS select
                                     Student.Stu_id,
                                     Student.Stu_name,
                                     AVG(StudentGrade.Grade) as Score_avg,
                                     Class.Class_name,
                                     Teacher.Teac_name as Director_name,
                                     Department.Depar_name
                                  from
                                     Student,
                                     Class,
                                     Teacher,
                                     Department,
                                     StudentGrade
                                  where
                                     Student.Class_id = Class.Class_id
                                     and Class.Director = Teacher.Teac_id
                                     and Student.Stu_id = StudentGrade.Stu_id
                                     and Class.Depar_id = Department.Depar_id
                                  group by
                                     Student.Stu_id,
                                     Student.Stu_name,
                                     Class.Class_name,
                                     Teacher.Teac_name,
                                     Department.Depar_name;

/*==============================================================*/
/* View: Teacher_full_info                                      */
/*==============================================================*/
CREATE VIEW  Teacher_full_info AS select Teac_id, Teac_name, Salary, Teac_sex, Birthday, TechPost, Depar_name
                                  from Teacher, Department
                                  where Teacher.Depar_id = Department.Depar_id;

alter table Class add constraint FK_Class_Dept2 foreign key (Depar_id)
      references Department (Depar_id) on delete restrict on update restrict;

alter table Class add constraint FK_Director2 foreign key (Director)
      references Teacher (Teac_id) on delete restrict on update restrict;

alter table Class add constraint FK_Monitor foreign key (Monitor)
      references Student (Stu_id) on delete restrict on update restrict;

alter table CourseTeacher add constraint FK_CourseTeacher2 foreign key (Class_id)
      references Class (Class_id) on delete restrict on update restrict;

alter table CourseTeacher add constraint FK_CourseTeacher3 foreign key (Teac_id)
      references Teacher (Teac_id) on delete restrict on update restrict;

alter table CourseTeacher add constraint FK_CourseTeacher_course_id foreign key (Course_id)
      references Course (Course_id) on delete restrict on update restrict;

alter table Student add constraint FK_Stu_Class foreign key (Class_id)
      references Class (Class_id) on delete restrict on update restrict;

alter table StudentGrade add constraint FK_StudentGrade2 foreign key (Course_id)
      references Course (Course_id) on delete restrict on update restrict;

alter table StudentGrade add constraint FK_StudentGrade_stu_id foreign key (Stu_id)
      references Student (Stu_id) on delete restrict on update restrict;

alter table Teacher add constraint FK_Teac_Dept foreign key (Depar_id)
      references Department (Depar_id) on delete restrict on update restrict;


create procedure getFailStuByCourseId (IN cid varchar(4))
BEGIN
    Select Stu_id, Grade
    From StudentGrade
    Where Course_id = cid and Grade < 60;
END;


create trigger Auto_change_num
AFTER INSERT
on Student
for EACH ROW
begin
    update Department set Depar_number = 
    (select count(*)
    from Student, Class
    where Student.Class_id = Class.Class_id
    and Depar_id = Department.Depar_id)
    +
    (select count(*)
    from Teacher
    where Depar_id = Department.Depar_id);

    update class set Class_number = 
    (select count(*)
    from Student
    where Student.Class_id = Class.Class_id);
end;


create trigger Auto_create_Student_user
AFTER INSERT
on Student
for EACH ROW
begin
    insert into User
    (User_id, Password, Power)
    VALUES
    (new.Stu_id, '123456', 2);
end;


create trigger Auto_score_avg
AFTER INSERT
on StudentGrade
for EACH ROW
begin
    update Student set Score_avg = 
    (select avg(Grade)
    from StudentGrade
    where StudentGrade.Stu_id = new.Stu_id)
    where Stu_id = new.Stu_id;
end;


create trigger Auto_create_Teacher_user
AFTER INSERT
on Teacher
for EACH ROW
begin
    insert into User
    (User_id, Password, Power)
    VALUES
    (new.Teac_id, '123456', 1);
end;


create trigger Set_salary_min
BEFORE Update
on Teacher
for EACH ROW
begin
    DECLARE Total_course_hour INT;
    
    Select SUM(Course_hour) INTO Total_course_hour 
    from Course, CourseTeacher
    where Course.Course_id = CourseTeacher.Course_id and Teac_id = new.Teac_id;
    
    IF new.Salary < 5000 + Total_course_hour*30/12 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR: Unreasonable Salary!';
    END IF;
end;
