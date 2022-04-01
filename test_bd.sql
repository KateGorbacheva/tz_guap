-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Апр 01 2022 г., 16:04
-- Версия сервера: 8.0.28-0ubuntu0.20.04.3
-- Версия PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test_bd`
--

-- --------------------------------------------------------

--
-- Структура таблицы `class`
--

CREATE TABLE `class` (
  `id_class` int NOT NULL,
  `num_direction` varchar(10) NOT NULL,
  `full_direction` varchar(100) NOT NULL,
  `id_task` int DEFAULT NULL,
  `id_lesson` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `class`
--

INSERT INTO `class` (`id_class`, `num_direction`, `full_direction`, `id_task`, `id_lesson`) VALUES
(711, '03.07.09', 'ИТ технологии', 3, 3),
(4731, '09.03.04', 'Программная инженерия', 1, 1),
(4736, '09.03.06', 'Мат обеспечение', 1, 1);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `i`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `i` (
`id_ts_i` int
,`ins_t` bigint
,`name_ts_i` varchar(100)
);

-- --------------------------------------------------------

--
-- Структура таблицы `inspector`
--

CREATE TABLE `inspector` (
  `id_inspector` int NOT NULL,
  `name_ins` varchar(30) NOT NULL,
  `lastname_ins` varchar(30) NOT NULL,
  `otchestvo_ins` varchar(30) NOT NULL,
  `position` varchar(100) NOT NULL,
  `id_lesson` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `inspector`
--

INSERT INTO `inspector` (`id_inspector`, `name_ins`, `lastname_ins`, `otchestvo_ins`, `position`, `id_lesson`) VALUES
(1, 'Мария', 'Фаттахова', 'Владимировна', 'доцент мат наук', NULL),
(2, 'Сергей', 'Рогачев', 'Александрович', 'старший преподаватель', NULL),
(3, 'Светлана', 'Колесникова', 'Ивановна', 'профессор', NULL),
(4, 'Александр', 'Ключарев', 'Анотольевич', 'доцент', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `lesson`
--

CREATE TABLE `lesson` (
  `id_lesson` int NOT NULL,
  `type_les` varchar(10) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `id_task` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `lesson`
--

INSERT INTO `lesson` (`id_lesson`, `type_les`, `subject`, `id_task`) VALUES
(1, 'Л', 'Проектирование систем', NULL),
(2, 'ЛР', 'Встроенные приложения', NULL),
(3, 'ПР', 'Мобильные приложения', NULL),
(4, 'КР', 'Мобильные приложения', NULL),
(5, 'Л', 'Системный анализ', NULL),
(6, 'Л', 'Научно-технический семинар', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `rel_ins_task`
--

CREATE TABLE `rel_ins_task` (
  `id_ins_task` int NOT NULL,
  `id_inspector` int NOT NULL,
  `id_task` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `rel_ins_task`
--

INSERT INTO `rel_ins_task` (`id_ins_task`, `id_inspector`, `id_task`) VALUES
(2, 2, 1),
(3, 1, 3),
(4, 4, 3),
(5, 1, 2),
(6, 2, 4),
(7, 3, 3),
(8, 3, 6),
(9, 4, 8),
(10, 3, 8),
(11, 2, 7),
(12, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `rel_stud_class`
--

CREATE TABLE `rel_stud_class` (
  `id_rel` int NOT NULL,
  `id_student` int NOT NULL,
  `id_class` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `rel_stud_class`
--

INSERT INTO `rel_stud_class` (`id_rel`, `id_student`, `id_class`) VALUES
(1, 1, 4731),
(2, 2, 4731),
(3, 3, 4731),
(4, 4, 4736),
(5, 5, 4736),
(6, 6, 4736),
(7, 7, 711),
(8, 8, 711),
(9, 9, 711),
(10, 10, 711);

-- --------------------------------------------------------

--
-- Структура таблицы `rel_task_stud`
--

CREATE TABLE `rel_task_stud` (
  `id_ts_st` int NOT NULL,
  `id_task` int NOT NULL,
  `id_stud` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `rel_task_stud`
--

INSERT INTO `rel_task_stud` (`id_ts_st`, `id_task`, `id_stud`) VALUES
(1, 3, 1),
(2, 3, 3),
(3, 2, 1),
(4, 6, 4),
(5, 7, 5),
(6, 7, 10),
(7, 7, 6),
(8, 8, 9),
(9, 8, 7),
(10, 8, 1),
(11, 1, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `id_student` int NOT NULL,
  `name_stud` varchar(30) NOT NULL,
  `lastname_stud` varchar(30) NOT NULL,
  `otchestvo_stud` varchar(30) NOT NULL,
  `email_stud` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `student`
--

INSERT INTO `student` (`id_student`, `name_stud`, `lastname_stud`, `otchestvo_stud`, `email_stud`) VALUES
(1, 'Екатерина', 'Горбачева', 'Александровна', 'sjsjjs@dd.ru'),
(2, 'Анастасия', 'Иванова', 'Ивановна', 'gdgdgd@sjsj.com'),
(3, 'Эдуард', 'Пупкин', 'Олегович', 'hhsh@kdkd.fg'),
(4, 'Сергей', 'Соломин', 'Сергеевич', 'sgsgs@sll.re'),
(5, 'Екатерина', 'Головкина', 'Андреевна', 'fgfhfh@hdhdj.oi'),
(6, 'Юрий', 'Кочанов', 'Николаевич', 'fgfg@sk.ly'),
(7, 'Илья', 'Пасс', 'Сергеевич', 'fhhfh@dgd.rr'),
(8, 'Федор', 'Змиевский', 'Олегович', 'ksksk@dgd.tr'),
(9, 'Никита', 'Бережных', 'Эдуардович', 'shh@dd.ru'),
(10, 'Анастасия', 'Ткаченко', 'Сергеевна', 'agagag@ddd.ty');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `t`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `t` (
`id_ts_t` int
,`name_ts_t` varchar(100)
,`st` bigint
);

-- --------------------------------------------------------

--
-- Структура таблицы `task`
--

CREATE TABLE `task` (
  `id_task` int NOT NULL,
  `name_task` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `task`
--

INSERT INTO `task` (`id_task`, `name_task`) VALUES
(1, 'тестовое задание'),
(2, 'Лабораторная по мат анализу'),
(3, 'рассчитать вероятности'),
(4, 'проектирование системы'),
(5, 'проектирование системы'),
(6, 'решение задачи по мат логике'),
(7, 'доделать задачу с пары'),
(8, 'написать требования к диплому');

-- --------------------------------------------------------

--
-- Структура для представления `i`
--
DROP TABLE IF EXISTS `i`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `i`  AS  select `task`.`id_task` AS `id_ts_i`,`task`.`name_task` AS `name_ts_i`,count(`rel_ins_task`.`id_task`) AS `ins_t` from (`rel_ins_task` join `task` on((`task`.`id_task` = `rel_ins_task`.`id_task`))) where `rel_ins_task`.`id_task` in (select distinct `rel_task_stud`.`id_task` from (`rel_task_stud` join `task` on((`task`.`id_task` = `rel_task_stud`.`id_task`))) where `rel_task_stud`.`id_task` in (select `rel_ins_task`.`id_task` AS `stud_task` from (`rel_ins_task` join `task` on((`task`.`id_task` = `rel_ins_task`.`id_task`))))) group by `task`.`id_task` ;

-- --------------------------------------------------------

--
-- Структура для представления `t`
--
DROP TABLE IF EXISTS `t`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `t`  AS  select `task`.`id_task` AS `id_ts_t`,`task`.`name_task` AS `name_ts_t`,count(`rel_task_stud`.`id_task`) AS `st` from (`rel_task_stud` join `task` on((`task`.`id_task` = `rel_task_stud`.`id_task`))) where `rel_task_stud`.`id_task` in (select distinct `rel_task_stud`.`id_task` from (`rel_task_stud` join `task` on((`task`.`id_task` = `rel_task_stud`.`id_task`))) where `rel_task_stud`.`id_task` in (select `rel_ins_task`.`id_task` AS `stud_task` from (`rel_ins_task` join `task` on((`task`.`id_task` = `rel_ins_task`.`id_task`))))) group by `task`.`id_task` ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id_class`),
  ADD KEY `id_task` (`id_task`),
  ADD KEY `id_lesson` (`id_lesson`);

--
-- Индексы таблицы `inspector`
--
ALTER TABLE `inspector`
  ADD PRIMARY KEY (`id_inspector`),
  ADD KEY `id_lesson` (`id_lesson`);

--
-- Индексы таблицы `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`id_lesson`),
  ADD KEY `id_task` (`id_task`);

--
-- Индексы таблицы `rel_ins_task`
--
ALTER TABLE `rel_ins_task`
  ADD PRIMARY KEY (`id_ins_task`),
  ADD KEY `id_inspector` (`id_inspector`),
  ADD KEY `id_task` (`id_task`);

--
-- Индексы таблицы `rel_stud_class`
--
ALTER TABLE `rel_stud_class`
  ADD PRIMARY KEY (`id_rel`),
  ADD KEY `id_class` (`id_class`),
  ADD KEY `id_student` (`id_student`);

--
-- Индексы таблицы `rel_task_stud`
--
ALTER TABLE `rel_task_stud`
  ADD PRIMARY KEY (`id_ts_st`),
  ADD KEY `id_task` (`id_task`),
  ADD KEY `id_stud` (`id_stud`);

--
-- Индексы таблицы `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id_student`);

--
-- Индексы таблицы `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id_task`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `inspector`
--
ALTER TABLE `inspector`
  MODIFY `id_inspector` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `lesson`
--
ALTER TABLE `lesson`
  MODIFY `id_lesson` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `rel_ins_task`
--
ALTER TABLE `rel_ins_task`
  MODIFY `id_ins_task` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `rel_stud_class`
--
ALTER TABLE `rel_stud_class`
  MODIFY `id_rel` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `rel_task_stud`
--
ALTER TABLE `rel_task_stud`
  MODIFY `id_ts_st` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `student`
--
ALTER TABLE `student`
  MODIFY `id_student` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `task`
--
ALTER TABLE `task`
  MODIFY `id_task` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`id_task`) REFERENCES `task` (`id_task`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`id_lesson`) REFERENCES `lesson` (`id_lesson`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `inspector`
--
ALTER TABLE `inspector`
  ADD CONSTRAINT `inspector_ibfk_2` FOREIGN KEY (`id_lesson`) REFERENCES `lesson` (`id_lesson`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `lesson_ibfk_1` FOREIGN KEY (`id_task`) REFERENCES `task` (`id_task`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `rel_ins_task`
--
ALTER TABLE `rel_ins_task`
  ADD CONSTRAINT `rel_ins_task_ibfk_1` FOREIGN KEY (`id_inspector`) REFERENCES `inspector` (`id_inspector`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `rel_ins_task_ibfk_2` FOREIGN KEY (`id_task`) REFERENCES `task` (`id_task`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `rel_stud_class`
--
ALTER TABLE `rel_stud_class`
  ADD CONSTRAINT `rel_stud_class_ibfk_1` FOREIGN KEY (`id_class`) REFERENCES `class` (`id_class`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `rel_stud_class_ibfk_2` FOREIGN KEY (`id_student`) REFERENCES `student` (`id_student`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `rel_task_stud`
--
ALTER TABLE `rel_task_stud`
  ADD CONSTRAINT `rel_task_stud_ibfk_1` FOREIGN KEY (`id_task`) REFERENCES `task` (`id_task`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `rel_task_stud_ibfk_2` FOREIGN KEY (`id_stud`) REFERENCES `student` (`id_student`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
