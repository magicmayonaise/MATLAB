%%  modified the scorelog 
LogPath = 'E:\postdoc\video Analysis\B_scorelog\PAG_GCamp6s_raw';
DirPath = 'E:\postdoc\video Analysis\B_scorelog\fscope_modified_log';
NoBehLogPath = 'E:\postdoc\video Analysis\B_scorelog\fscope_modified_log\No beh';
file_list = sortdir(LogPath,'*log*20210323*.mat');
for i = 1:length(file_list)
    logFile = file_list{i};
%     modified_log_into_log_2(LogPath,logFile,DirPath,NoBehLogPath)
    modified_log_into_log_2_1(LogPath,logFile,DirPath,NoBehLogPath)
    i
end

%%
%% modified the fscope data and transfer it into mat
fscopePath = 'E:\postdoc\video Analysis\A_fscope';
fscopeMatPath = 'E:\postdoc\video Analysis\A_fscope';
FigPath = 'E:\postdoc\video Analysis\A_fscope\Fig';
LogPath = 'E:\postdoc\video Analysis\B_scorelog\PAG_GCamp6s_raw';
cd(fscopePath)
file_list = sortdir(LogPath,'*20210323*.mat');
for i = 1:length(file_list)
    FileName = file_list{i}(4:end-4);
    logFile = ['log',FileName,'.mat'];
    fscopesh_modified_into_mat(fscopePath,fscopeMatPath,FigPath,LogPath,FileName,logFile);
    close all;
end