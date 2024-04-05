System.debug(HouseService.getRecords());

Opportunity o = new Opportunity();
o.Name = 'Opp Belongs to ' + System.now();
                    o.StageName = 'Prospecting';
                    o.CloseDate = Date.today().addMonths(2);
                    o.Amount = 10000;
                    o.Description = ' Created because industry is Agriculture';
                    insert o;

System.debug(UserInfo.getUserId());