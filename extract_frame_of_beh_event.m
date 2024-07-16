function [beh_event_frame FrameRate] = extract_frame_of_beh_event(LogFile,LogPath,beh)

% this code is used to find the frame of the start and end of the
% behavioral event with multiple subjects
% written by ycwei,12/5/2018

%%
% LogPath = 'C:\ycwei\postdoc\video Analysis\B_scorelog';
% LogFile = 'logTRAP_mm1_20181128_1_PAGNpHR_bi_opto_PAG_2mW_male.mat';
% beh = 'light';
%% load the trigger frame, the start and the end frame of different event,
%% the time per frame from the mat developed by score the video
cd(LogPath)
load(LogFile);

FrameRate = info.vfpstp;
action_beh = uc.desc;
action_abbname = uc.bchar;
action_end_char = uc.echar;
action_subj = uc.subj;

beh_idx = strcmp(action_beh,beh);
beh_idx = find(beh_idx == 1);
charnum = fulllog.charnum;
charnum = cell2mat(charnum);
beh_frame = fulllog.frame;
beh_frame = cell2mat(beh_frame);
beh_frame_idx = find(charnum == beh_idx);
specific_beh_frame = beh_frame(beh_frame_idx);
if length(beh_frame_idx) == 1
    beh_event_frame(:,1) = specific_beh_frame;
    beh_event_frame(:,2) = specific_beh_frame;

else
    beh_event_frame(:,1) = specific_beh_frame(1:2:end);
    beh_event_frame(:,2) = specific_beh_frame(2:2:end);
end



% beh_bchar = action_abbname{beh_idx};
% beh_echar = action_end_char{beh_idx};
% beh_frame = fulllog.frame;
% beh_frame = cell2mat(beh_frame);
% [num indx] = unique(beh_frame);
% 
% 
% beh_subj = str2double(action_subj{beh_idx});
% log_subj_raw = fulllog.subj;
% log_subj_raw = cell2mat(log_subj_raw);
% log_subj = log_subj_raw(indx);
% ana_idx = find(log_subj == beh_subj);
% ana_rawlog = rawlog(ana_idx);
% ana_rawlogframe = rawlogframe(ana_idx);
% 
% beh_change_idx = strcmp(ana_rawlog,beh_bchar);
% beh_change_idx = find(beh_change_idx == 1);
% beh_start_frame = ana_rawlogframe(beh_change_idx);
% beh_end_frame = ana_rawlogframe(beh_change_idx+1);
% beh_event_frame = [beh_start_frame,beh_end_frame];
