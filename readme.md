# 教务系统数据库的实现

## 环境说明

1. 本代码于 sql5.0 上调试完成，但存在 check 约束无法导入的问题

## 文件说明

1. School_ena_final.cdm：PowerDesigner 的概念设计模型
2. School_ena_final.pdm：PowerDesigner 的物理设计模型
3. create_database.sql：从物理设计模型中导出的创建数据库脚本
4. insert_data.sql：插入样例数据的脚本
5. constraint&trigger_test.sql：测试约束和触发器的语句，其中删除触发器部分没有设计完整
6. 数据库大作业.docx：系统设计与实现的报告文档
7. school.txt：从物理设计模型到数据库实施中间的开发历程与调试信息。
8. school_ena_dump.sql：在 mysql5.0 实施数据库后，导出的 dump
