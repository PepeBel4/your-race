#user = User.create!(email: 'pascal_peeters@icloud.com', nickname: 'Pepebel4', name: 'Pascal Peeters', password: 'ericajane_05')
#user = User.create!(email: 'bing.ye@test.be', name: 'Bing Ye', password: 'testtest')
#user = User.create!(email: 'mengfan.gao@test.be', name: 'Mengfan Gao', password: 'testtest')
#user = User.create!(email: 'mateo.sanlanz@test.be', name: 'Mateo Sanz Lanz', password: 'testtest')
#user.add_role 'admin'

competition = Competition.create!(title: 'RS:X World Championships 2018', created_by: 'auth0|59c647827b343507494dacb5')

group = Group.create!(competition_id: 1, name: 'RS:X Men')
group = Group.create!(competition_id: 1, name: 'RS:X Women')

competitor = Competitor.create!(group_id: 1, number:'BEL1', name:'Pascal Peeters')
competitor = Competitor.create!(group_id: 1, number:'BEL2', name:'Vanessa Peeters')
competitor = Competitor.create!(group_id: 1, number:'BEL3', name:'Bianca Peeters')

fleet = Fleet.create!(group_id: 1, fleet_type: 'Qualification', name: 'Yellow')
fleet = Fleet.create!(group_id: 1, fleet_type: 'Qualification', name: 'Blue')

race = Race.create!(fleet_id: 1, name: 'Race 1', race_type: 'Qualification', race_order:1, final: false)
race = Race.create!(fleet_id: 1, name: 'Race 2', race_type: 'Qualification', race_order:2, final: false)
race = Race.create!(fleet_id: 1, name: 'Race 3', race_type: 'Qualification', race_order:3, final: false)

race = Race.create!(fleet_id: 2, name: 'Race 1', race_type: 'Qualification', race_order:1, final: false)
race = Race.create!(fleet_id: 2, name: 'Race 2', race_type: 'Qualification', race_order:2, final: false)
race = Race.create!(fleet_id: 2, name: 'Race 3', race_type: 'Qualification', race_order:3, final: false)


metric = Metric.create!(race_id: 1, name: 'Mark 1', metric_order: 1, metric_type: 'Mark')
metric = Metric.create!(race_id: 1, name: 'Mark 2', metric_order: 1, metric_type: 'Mark')
metric = Metric.create!(race_id: 1, name: 'Mark 3', metric_order: 1, metric_type: 'Mark')
metric = Metric.create!(race_id: 1, name: 'Finish', metric_order: 1, metric_type: 'Finish')

metric = Metric.create!(race_id: 4, name: 'Finish', metric_order: 1, metric_type: 'Finish')

race_competitor = RaceCompetitor.create!(race_id: 1, competitor_id: 1)
race_competitor = RaceCompetitor.create!(race_id: 1, competitor_id: 2)

race_competitor = RaceCompetitor.create!(race_id: 4, competitor_id: 3)

finish = Finish.create(metric_id: 4, race_competitor_id: 1)
finish = Finish.create(metric_id: 4, race_competitor_id: 2)
finish = Finish.create(metric_id: 5, race_competitor_id: 3)

