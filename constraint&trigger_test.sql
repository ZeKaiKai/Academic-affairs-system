-- Department Phone CHECK 约束
UPDATE Department SET Depar_phone = '39351234' WHERE Depar_id = '01';
UPDATE Department SET Depar_phone = '85211234' WHERE Depar_id = '01';


-- Student Phone CHECK 约束
UPDATE Student SET Phone = '18812345678' WHERE Stu_id = '000503001';
UPDATE Student SET Phone = '55512349999' WHERE Stu_id = '000503001';


-- Teacher Phone CHECK 约束
UPDATE Teacher SET Teac_phone = '18912345678' WHERE Teac_id = '0102';
UPDATE Teacher SET Teac_phone = '55566669999' WHERE Teac_id = '0102';


-- Student Auto_change_num AFTER INSERT TRIGGER
-- Student Auto_create_Student_user AFTER INSERT TRIGGER
-- -- 插入新学生前人数
SELECT Depar_number FROM Department WHERE Depar_id = '05'; 
-- -- 插入新学生
INSERT INTO `student` VALUES ('990502010', '测试', '男', '1989-11-11', '13977123481', '广州市', '0502', NULL);
-- -- 检查插入后触发器有没有更新人数
SELECT Depar_number FROM Department WHERE Depar_id = '05'; 
-- -- 检查插入后触发器有没有给新学生添加账户
SELECT User_id,Password,Power FROM user WHERE User_id = '990502010';
-- -- 删除测试学生
DELETE FROM Student WHERE Stu_id = '990502010';
-- -- 检查插入后触发器有没有更新人数
SELECT Depar_number FROM Department WHERE Depar_id = '05'; 
-- -- 检查学生账户是否删除
-- -- SELECT User_id,Password,Power FROM user WHERE User_id = '990502010';


-- StudentGrade Auto_score_avg AFTER INSERT TRIGGER
-- -- 查看添加新成绩前学生的平均分
SELECT Score_avg FROM Student WHERE Stu_id = '000503001';
-- -- 添加一个新成绩
INSERT INTO StudentGrade VALUES ('000503001', '0509', 66);
-- -- 查看添加新成绩后触发器有没有修改学生的平均分
SELECT Score_avg FROM Student WHERE Stu_id = '000503001';
-- -- 删除测试成绩
DELETE FROM StudentGrade WHERE Stu_id = '000503001' and Course_id = '0509';
-- -- 查看添加新成绩后触发器有没有修改学生的平均分
SELECT Score_avg FROM Student WHERE Stu_id = '000503001';


-- Teacher Auto_create_Teacher_user AFTER INSERT TRIGGER
-- -- 添加测试教师
INSERT INTO `teacher` VALUES ('0508', '测试老师', '男', '1978-11-12', '教授', '05', '18966665555', 50000);
-- -- 检查触发器是否给该老师创建了账户
SELECT User_id,Password,Power FROM user WHERE User_id = '0508';
-- -- 删除测试教师
DELETE FROM Teacher WHERE Teac_id = '0508';
-- -- 检查触发器是否删除了该老师的账户
-- -- SELECT User_id,Password,Power FROM user WHERE User_id = '0508';


-- Teacher Set_salary_min BEFORE UPDATE TRIGGER
UPDATE Teacher SET Salary = 60000 WHERE Teac_id = '0102';
UPDATE Teacher SET Salary = 3000 WHERE Teac_id = '0102';


