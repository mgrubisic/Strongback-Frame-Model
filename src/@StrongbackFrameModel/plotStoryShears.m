function fig = plotStoryShears(obj, results, plottype)

fig = figure;
xmax = 0;

switch plottype
case 'subplots'
    plots = obj.nStories:-1:1;
    for iStory = 1:obj.nStories
        subplot(obj.nStories, 1, plots(iStory))
        plot(results.storyDrift(:,iStory), results.storyShear(:,iStory))
        xl = xlim;
        xmax = max(xmax, xl(2));
        xlim([0 xmax])
        grid on
    end
case 'singleplot'
    hold on
    for iStory = 1:obj.nStories
        plot(results.storyDrift(:,iStory), results.storyShear(:,iStory))
    end
    xl = xlim;
    xmax = max(xmax, xl(2));
    xlim([0 xmax])
    grid on
otherwise
    error('Invalid plot type: %s', plottype)
end

if nargout == 0
    clear fig;
end

end
