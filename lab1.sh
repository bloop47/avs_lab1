#!/bin/bash

cd ~

mkdir -p lab0/claude_monet/kitchen/hot_station
mkdir -p lab0/claude_monet/kitchen/cold_station
mkdir -p lab0/claude_monet/hall
mkdir -p lab0/claude_monet/office
mkdir -p lab0/locker_room

echo "Подготовить горячий цех к вечерней смене" > lab0/claude_monet/kitchen/hot_station/barinov_order
echo "Проверить рабочие места поваров" >> lab0/claude_monet/kitchen/hot_station/barinov_order
echo "Макса к плите без разрешения не подпускать" >> lab0/claude_monet/kitchen/hot_station/barinov_order

echo "Сеня отвечает за мясные блюда" > lab0/claude_monet/kitchen/hot_station/senya_task
echo "Получить продукты на складе" >> lab0/claude_monet/kitchen/hot_station/senya_task
echo "Перед закрытием проверить остатки" >> lab0/claude_monet/kitchen/hot_station/senya_task

echo "Федя отвечает за рыбные блюда" > lab0/claude_monet/kitchen/cold_station/fedya_task
echo "Проверить свежесть сибаса и дорадо" >> lab0/claude_monet/kitchen/cold_station/fedya_task
echo "Подготовить холодные закуски для гостей" >> lab0/claude_monet/kitchen/cold_station/fedya_task

echo "Утиная ножка с овощами" > lab0/claude_monet/kitchen/menu_draft
echo "Луковый суп по рецепту шефа" >> lab0/claude_monet/kitchen/menu_draft
echo "Фирменный десерт от Луи" >> lab0/claude_monet/kitchen/menu_draft
echo "Новое блюдо Макса отправлено на доработку" >> lab0/claude_monet/kitchen/menu_draft

echo "Столик 3 забронирован на восемнадцать часов" > lab0/claude_monet/hall/reservations
echo "Столик 7 подготовить для постоянных гостей" >> lab0/claude_monet/hall/reservations
echo "Большой стол оставить для вечернего банкета" >> lab0/claude_monet/hall/reservations

echo "Гости похвалили десерт и работу официантов" > lab0/claude_monet/hall/guest_reviews
echo "Один гость слишком долго ждал горячее блюдо" >> lab0/claude_monet/hall/guest_reviews
echo "Постоянные гости попросили вернуть старое меню" >> lab0/claude_monet/hall/guest_reviews
echo "Новый повар Макс показался гостям растерянным" >> lab0/claude_monet/hall/guest_reviews

echo "Вика проводит собрание перед открытием ресторана" > lab0/claude_monet/office/vika_schedule
echo "В семнадцать часов проверить готовность зала" >> lab0/claude_monet/office/vika_schedule
echo "После смены принять отчёт от Макса" >> lab0/claude_monet/office/vika_schedule

echo "Максим Лавров приехал в Москву из Воронежа" > lab0/locker_room/max_resume
echo "Хочет стать профессиональным поваром" >> lab0/locker_room/max_resume
echo "Готов работать в ресторане Claude Monet" >> lab0/locker_room/max_resume
echo "Опыта мало, но желания много" >> lab0/locker_room/max_resume

echo "Лёва должен показать Максу рабочее место" > lab0/locker_room/leva_note
echo "Объяснить правила кухни и порядок выдачи блюд" >> lab0/locker_room/leva_note
echo "О результате доложить Виктору Петровичу" >> lab0/locker_room/leva_note

echo "Владелец ресторана приедет вечером" > lab0/nagiev_message
echo "Подготовить лучший стол в зале" >> lab0/nagiev_message
echo "Баринов должен лично представить новое меню" >> lab0/nagiev_message

echo "Макс прибыл в ресторан вовремя" > lab0/first_shift
echo "Лёва выдал ему форму" >> lab0/first_shift
echo "Первая задача получена от шефа" >> lab0/first_shift


chmod 755 lab0/claude_monet
chmod u=rwx,g=rx,o= lab0/claude_monet/kitchen
chmod 770 lab0/claude_monet/kitchen/hot_station
chmod 640 lab0/claude_monet/kitchen/hot_station/barinov_order
chmod 640 lab0/claude_monet/kitchen/hot_station/senya_task
chmod u=rwx,g=rx,o= lab0/claude_monet/kitchen/cold_station
chmod 600 lab0/claude_monet/kitchen/cold_station/fedya_task
chmod 644 lab0/claude_monet/kitchen/menu_draft
chmod 755 lab0/claude_monet/hall
chmod 664 lab0/claude_monet/hall/reservations
chmod 444 lab0/claude_monet/hall/guest_reviews
chmod u=rwx,g=x,o= lab0/claude_monet/office
chmod 640 lab0/claude_monet/office/vika_schedule
chmod u=rwx,g=rx,o= lab0/locker_room
chmod 600 lab0/locker_room/max_resume
chmod u=r,g=r,o= lab0/locker_room/leva_note
chmod 444 lab0/nagiev_message
chmod 644 lab0/first_shift  

cp lab0/locker_room/max_resume lab0/claude_monet/office/candidate_max
cp -r lab0/claude_monet/hall lab0/claude_monet/kitchen/hall_backup 
ln -s ../claude_monet/kitchen/menu_draft lab0/locker_room/first_menu
ln -s claude_monet/hall lab0/guest_zone
ln lab0/first_shift lab0/claude_monet/kitchen/shift_plan
cat lab0/claude_monet/kitchen/hot_station/senya_task lab0/claude_monet/kitchen/cold_station/fedya_task > lab0/claude_monet/kitchen/team_tasks
cat lab0/locker_room/leva_note >> lab0/first_shift
mv lab0/nagiev_message lab0/claude_monet/office/owner_message

ls -lR lab0 | grep '^-' | sort -k5,5nr | head -n 5
grep -rih 'макс' lab0/* | grep -vi 'отчёт' | sort -r| head -n 4
grep -i -e 'блюд' -e 'продукт' lab0/claude_monet/kitchen/hot_station/*_task lab0/claude_monet/kitchen/cold_station/*_task|sort| wc -w
ls -lR lab0 | grep '^-.* 2' |sort -r -k9

head -q -n 1 lab0/claude_monet/kitchen/hot_station/* > five
tail -q -n 1 lab0/claude_monet/kitchen/hot_station/* >> five
cat five|sort
rm five

grep -i 'гост' lab0/claude_monet/hall/guest_reviews | grep -iv 'постоянн' | sort -r | head -n 2
grep -ril 'гост' lab0/claude_monet/kitchen/hall_backup | wc -l



rm lab0/locker_room/max_resume
rm lab0/locker_room/first_menu
rm lab0/guest_zone
rm lab0/first_shift
rm lab0/claude_monet/kitchen/shift_plan
rm lab0/claude_monet/kitchen/cold_station/fedya_task
rmdir lab0/claude_monet/kitchen/cold_station
rm -r lab0/claude_monet/kitchen/hall_backup
