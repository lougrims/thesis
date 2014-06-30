close all
clear all

% display off

names=dir('*.fig');


for i=1:length(names)
    % open all the .fig files
    
display off
    openfig(names(i).name)

    set(findall(gcf,'Type','text'),'FontSize',12) % change labels and legend size
    set(findall(gcf,'type','axes'),'fontsize',10) % change axis numbers size
    set(findall(gcf,'type','line'),'LineWidth',2) % change line width
    set(findall(gcf,'type','line'),'MarkerSize',9) % changes marker size
     
%     legend(findall(gcf,'type','axes'),'Location','Best')
 
     set(gcf,'WindowStyle','normal')
     set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [0 0 6 4.2]);
    set(gcf,'units','inches','outerposition',[0 0 6 4.2])
set(findall(gcf,'type','legend'),'Position','best') % changes marker size
    saveas(gcf,names(i).name(1:end-4),'fig')

    saveas(gcf,names(i).name(1:end-4),'epsc')
    
    close all
    

end
