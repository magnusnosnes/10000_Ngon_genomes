plot_importation_local = function(tree,result_import_local_transmission,start_time,
                                               date_breaks="2 years",time_interval=c("2000-05-01","2016-05-01"), main_title = "")
{
  nrep= nrow(result_import_local_transmission$Import)
  time_end = start_time+max(nodeHeights(tree))
  interval_importations = apply(result_import_local_transmission$Import,2, FUN="mean")
  interval_local_tranmissions = apply(result_import_local_transmission$LC,2, FUN="mean")
  sum_cases = interval_importations+interval_local_tranmissions
  
  #Plotting method
  imports = t(apply(result_import_local_transmission$Import, 2,quantile,c(0.025,0.5,0.975)))
  local_transmission = t(apply(result_import_local_transmission$LC, 2,quantile,c(0.025,0.5,0.975)))
  #Set up data
  
  clims = decimal_date(as.Date(time_interval))
  indselect=which(result_import_local_transmission$Week_time>=clims[1]&result_import_local_transmission$Week_time<=clims[2])
  dat=data.frame(cbind(imports,local_transmission),dates=as.Date(date_decimal(result_import_local_transmission$Week_time)))
  dat = dat[indselect,]
  colnames(dat)=c("i2.5","i50","i97.5","e2.5","e50","e97.5","dates")
  
  library(grid) #Requires the grid package for plotting
    g1_1 = ggplot(dat, aes(x=dates,y=i50))+geom_line(col="Blue")+theme_minimal(base_size=20)+ggtitle(main_title)+
      theme(axis.title.x = element_blank(), axis.text.x = element_blank())+
      geom_ribbon(aes(ymin=i2.5, ymax=i97.5,alpha=0.2), fill="blue")+
      scale_x_date(date_breaks=date_breaks,limits = as.Date(time_interval),labels=date_format("%d %b %Y"), expand=c(0,0))+
      ylab("Import")+
      theme(legend.position = "none",plot.title = element_text(hjust = 0.5))
    #g1_1
    
    
    g2_2 = ggplot(dat, aes(x=dates,y=e50))+geom_line(col="red")+theme_minimal(base_size=20)+
      theme(axis.title.x = element_blank())+
      geom_ribbon(aes(ymin=e2.5, ymax=e97.5,alpha=0.2), fill="red")+
      scale_x_date(date_breaks=date_breaks,limits = as.Date(time_interval),labels=date_format("%d %b %Y"), expand=c(0,0))+
      ylab("Local transmissions")+
      theme(axis.text.x=element_text(angle=60, hjust=1))+
      theme(legend.position = "none")
    
    grid.draw(rbind(ggplotGrob(g1_1), ggplotGrob(g2_2), size = "last"))
}


plot_importation_local_without_dates = function(tree,result_import_local_transmission,start_time,
                                  date_breaks=2,time_interval=c("2000-05-01","2016-05-01"), main_title = "")
{
  nrep= nrow(result_import_local_transmission$Import)
  time_end = start_time+max(nodeHeights(tree))
  interval_importations = apply(result_import_local_transmission$Import,2, FUN="mean")
  interval_local_tranmissions = apply(result_import_local_transmission$LC,2, FUN="mean")
  sum_cases = interval_importations+interval_local_tranmissions
  
  #Plotting method
  imports = t(apply(result_import_local_transmission$Import, 2,quantile,c(0.025,0.5,0.975)))
  local_transmission = t(apply(result_import_local_transmission$LC, 2,quantile,c(0.025,0.5,0.975)))
  #Set up data
  
  clims = decimal_date(as.Date(time_interval))
  indselect=which(result_import_local_transmission$Week_time>=clims[1]&result_import_local_transmission$Week_time<=clims[2])
  dat=data.frame(cbind(imports,local_transmission),dates=as.Date(date_decimal(result_import_local_transmission$Week_time)))
  dat = dat[indselect,]
  colnames(dat)=c("i2.5","i50","i97.5","e2.5","e50","e97.5","dates")
  
  library(grid) #Requires the grid package for plotting
  g1_1 = ggplot(dat, aes(x=decimal_date(dates),y=i50))+geom_line(col="Blue")+theme_minimal(base_size=20)+ggtitle(main_title)+
    theme(axis.title.x = element_blank(), axis.text.x = element_blank())+
    geom_ribbon(aes(ymin=i2.5, ymax=i97.5,alpha=0.2), fill="blue")+
    scale_x_continuous(breaks=seq(decimal_date(as.Date(time_interval))[1], decimal_date(as.Date(time_interval))[2], date_breaks), expand=c(0,0))+
    ylab("Import")+
    theme(legend.position = "none",plot.title = element_text(hjust = 0.5))
  #g1_1
  
  g2_2 = ggplot(dat, aes(x=decimal_date(dates),y=e50))+geom_line(col="red")+theme_minimal(base_size=20)+
    theme(axis.title.x = element_blank())+
    geom_ribbon(aes(ymin=e2.5, ymax=e97.5,alpha=0.2), fill="red")+
    scale_x_continuous(breaks=seq(decimal_date(as.Date(time_interval))[1], decimal_date(as.Date(time_interval))[2], date_breaks), expand=c(0,0))+
    ylab("Local transmissions")+
    theme(legend.position = "none")
  
  grid.draw(rbind(ggplotGrob(g1_1), ggplotGrob(g2_2), size = "last"))
}
