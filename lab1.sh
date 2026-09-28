#!/bin/bash

cd ~

mkdir -p lab0/claude_monet/kitchen/hot_station
mkdir -p lab0/claude_monet/kitchen/cold_station
mkdir -p lab0/claude_monet/hall
mkdir -p lab0/claude_monet/office
mkdir -p lab0/locker_room
cat > lab0/claude_monet/kitchen/hot_station/barinov_order <<EOF
Подготовить горячий цех к вечерней смене
Проверить рабочие места поваров
Макса к плите без разрешения не подпускать
EOF

cat > lab0/claude_monet/kitchen/hot_station/senya_task <<EOF
Сеня отвечает за мясные блюда
Получить продукты на складе
Перед закрытием проверить остатки
EOF

cat > lab0/claude_monet/kitchen/cold_station/fedya_task <<EOF
Федя отвечает за рыбные блюда
Проверить свежесть сибаса и дорадо
Подготовить холодные закуски для гостей
EOF
cat > lab0/claude_monet/kitchen/menu_draft <<EOF
Утиная ножка с овощами
Луковый суп по рецепту шефа
Фирменный десерт от Луи
Новое блюдо Макса отправлено на доработку
EOF

cat > lab0/claude_monet/hall/reservations <<EOF
Столик 3 забронирован на восемнадцать часов
Столик 7 подготовить для постоянных гостей
Большой стол оставить для вечернего банкета
EOF

cat > lab0/claude_monet/hall/guest_reviews <<EOF
Гости похвалили десерт и работу официантов
Один гость слишком долго ждал горячее блюдо
Постоянные гости попросили вернуть старое меню
Новый повар Макс показался гостям растерянным
EOF
cat > lab0/claude_monet/office/vika_schedule <<EOF
Вика проводит собрание перед открытием ресторана
В семнадцать часов проверить готовность зала
После смены принять отчёт от Макса
EOF

cat > lab0/locker_room/max_resume <<EOF
Максим Лавров приехал в Москву из Воронежа
Хочет стать профессиональным поваром
Готов работать в ресторане Claude Monet
Опыта мало, но желания много
EOF

cat > lab0/locker_room/leva_note <<EOF
Лёва должен показать Максу рабочее место
Объяснить правила кухни и порядок выдачи блюд
О результате доложить Виктору Петровичу
EOF
cat > lab0/nagiev_message <<EOF
Владелец ресторана приедет вечером
Подготовить лучший стол в зале
Баринов должен лично представить новое меню
EOF

cat > lab0/first_shift <<EOF
Макс прибыл в ресторан вовремя
Лёва выдал ему форму
Первая задача получена от шефа
EOF
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

grep -rih 'макс' lab0 | grep -vi 'отчёт' | sort -r | head -n 4

grep -i -e 'блюд' -e 'продукт' lab0/claude_monet/kitchen/hot_station/*_task lab0/claude_monet/kitchen/cold_station/*_task | sort | wc -w
ls -lR lab0 | grep '^-' | grep ' 2 ' | sort -r -k9

head -q -n 1 lab0/claude_monet/kitchen/hot_station/* > five
tail -q -n 1 lab0/claude_monet/kitchen/hot_station/* >> five
cat five | sort
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
rm -rf lab0/claude_monet/kitchen/hall_backup
