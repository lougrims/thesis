close all
clear all
names=dir('*.fig');


for i=1:length(names)
    % open all the .fig files
    openfig(names(i).name)
    set(gcf,'units','normalized','outerposition',[0 0 1 1])

    set(findall(gcf,'Type','text'),'FontSize',15) % change labels and legend size
    set(findall(gcf,'type','axes'),'fontsize',15) % change axis numbers size
    set(findall(gcf,'type','line'),'LineWidth',2) % change line width
    set(findall(gcf,'type','line'),'MarkerSize',11) % changes marker size
    
    saveas(gcf,names(i).name(1:end-4),'epsc')
    
    close all
    

end
