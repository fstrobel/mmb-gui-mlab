modelbase.totaltime = cputime;
modelbase.homepath = cd;
addpath(modelbase.homepath);
modelbase.uphomepath =cd(cd('..'));
addpath(modelbase.uphomepath);
statusbar(0, 'Busy...');
%**********************************************************************************************************************
%                    This File For The Second Exercise (MMBOPT2)                                                             %
%**********************************************************************************************************************

%%
%*****************************************************************************
% The following code recovers information collected by the GUI OPT2MENU.fig  %
%                See MMB.m file for varaibles description                    %
%*****************************************************************************

global names;
global variabledim;
global mycolor;
global modelsvec;
global data;
global AL_Models;
global rulenames;
global rulenamesshort;
global rulenamesshort1;
global common_rule;
global myrulecolor;
global rule;
global OSenvironment;

global results;
global option1;
global option2;
global option4;
global option5;
global option6;
global shocks;
global horizon;

modelbase.exercise=2;
modelbase.models=find(modelsvec>0);
modelbase.names =names;
modelbase.variabledim = variabledim;
modelbase.mycolor = mycolor;
modelbase.modelchosen=find(modelsvec>0);
modelbase.OSenvironment = OSenvironment;

modelbase.rulenames = rulenames;
modelbase.rulenamesshort = rulenamesshort;
modelbase.rulenamesshort1 = rulenamesshort1;
modelbase.common_rule=common_rule;
modelbase.data=data;
modelbase.rule=rule;
rulechosen=find(rule>0);
modelbase.myrulecolor = myrulecolor;
modelbase.info = ones(size(rule,1),1);

modelbase.shocks=shocks;
maxhorizon=100;
modelbase.maxhorizon=maxhorizon;
modelbase.option(1) = option1;
modelbase.option(5)=option5;
modelbase.option(4)=option4;
modelbase.option(6)=option6;
modelbase.horizon=horizon;
modelbase.AL_Models = AL_Models;
modelbase.modelplottedIRF=[];
modelbase.modelplottedIRF=modelbase.modelchosen; % this is neccessary to plot a proper legend, that ignores the models,
modelbase.time = (0:modelbase.horizon)';
modelbase.time2 = (0:modelbase.horizon)';
modelbase.str={};
modelbase.rulelegend=[];
modelbase.rownrfp = 1;modelbase.rownrmp=1;
modelbase.rulerank=0;
% Create 'modelsbase.namesplot':
% (required for a proper print out of the model names in
% the graphical output)

for mo = 1:1:length(modelbase.names);
    namesplotaux = regexprep(modelbase.names(mo,:), '_', 'HERE_');
	if modelbase.OSenvironment == 0;
    	modelbase.namesplot(mo,:) = regexprep(namesplotaux, 'HERE', '\');
	else
		modelbase.namesplot(mo,:) = regexprep(namesplotaux, 'HERE', '/');
	end
end;

% Specifies the output file
if modelbase.OSenvironment == 0;
	modelbase.savepath = [modelbase.uphomepath num2str('\OUTPUT\') num2str('results.xls')];
	xls_check_if_open(modelbase.savepath, 'close');
else
	modelbase.savepath = [modelbase.uphomepath num2str('/OUTPUT/') num2str('results.xls')];
end

if strcmp(results, 'results.xls')
    delete(modelbase.savepath);% overwrite the output file 'results.xls' if no output file is specified by the user
else
	if modelbase.OSenvironment == 0;
    	modelbase.savepath = [modelbase.uphomepath num2str('\OUTPUT\') results]; % create a new output file else
	else
		modelbase.savepath = [modelbase.uphomepath num2str('/OUTPUT/') results]; % MacOS environment to create a new output file 
	end
end



disp(' ');
disp('Selected options:');
if modelbase.option(1) == 1
    disp('Autocorrelation functions will be plotted.');
else disp('Autocorrelation functions will not be plotted.');
end
modelbase.option(2) = option2;
modelbase.namesshocks= char(['Mon. Pol. Shock      '
    'Fiscal Pol. Shock    ']);
modelbase.namesinnos= char(['interest_'
    'fiscal_  ']);
if modelbase.option(2) == 1
    disp('Impulse response functions will be plotted.');
else disp('Impulse response functions will not be plotted.');
end

modelbase.innos = [];
choices=find(modelbase.shocks>0);
if modelbase.option(2)==1
    if modelbase.option(6)==1
        inno='allshocks';
        modelbase.innos=inno;
    else modelbase.innos=modelbase.namesinnos(choices,:);
    end
    modelbase.namesshocks = modelbase.namesshocks(choices,:);
    % this is neccesary for plotting the right shock in the right figure otherwise the order might get confused; if all model specific shocks are chosen, we put [] here. The names are assigned in stoch_simul_modelbase
    
end;

%%
%%%%%%%%   Loop for Solving a model together with each chosen rule and producing results %%%%%%

for i=1:size(modelbase.rulenames,1)
    if (modelbase.rule(i)>0) % If the i-th rule has been chosen
        modelbase.l=i; %Save the legend for the i-th rule
        %% The code block for rule choices
        if (i>2)
            
            cofintintb1 = modelbase.common_rule(i,1); cofintintb2 = modelbase.common_rule(i,2); cofintintb3 = modelbase.common_rule(i,3);
            cofintintb4 = modelbase.common_rule(i,4); cofintinf0 = modelbase.common_rule(i,5); cofintinfb1 = modelbase.common_rule(i,6); cofintinfb2 = modelbase.common_rule(i,7);
            cofintinfb3 = modelbase.common_rule(i,8); cofintinfb4 = modelbase.common_rule(i,9); cofintinff1 = modelbase.common_rule(i,10); cofintinff2 = modelbase.common_rule(i,11);
            cofintinff3 = modelbase.common_rule(i,12); cofintinff4 = modelbase.common_rule(i,13); cofintout = modelbase.common_rule(i,14); cofintoutb1 = modelbase.common_rule(i,15);
            cofintoutb2 = modelbase.common_rule(i,16); cofintoutb3 = modelbase.common_rule(i,17); cofintoutb4 = modelbase.common_rule(i,18); cofintoutf1 = modelbase.common_rule(i,19);
            cofintoutf2 = modelbase.common_rule(i,20); cofintoutf3 = modelbase.common_rule(i,21); cofintoutf4 = modelbase.common_rule(i,22);
            cofintoutp = modelbase.common_rule(i,23); cofintoutpb1 = modelbase.common_rule(i,24); cofintoutpb2 = modelbase.common_rule(i,25); cofintoutpb3 = modelbase.common_rule(i,26);
            cofintoutpb4 = modelbase.common_rule(i,27); cofintoutpf1 = modelbase.common_rule(i,28); cofintoutpf2 = modelbase.common_rule(i,29); cofintoutpf3 = modelbase.common_rule(i,30);
            cofintoutpf4 = modelbase.common_rule(i,31);
            std_r_ = modelbase.common_rule(i,32);
            std_r_quart = modelbase.common_rule(i,33);
            disp(' ')
            disp('Selected Policy Rule:');
            disp(deblank(modelbase.rulenames(i,:)));
            
        elseif i==1
            %
            % User-specified policy rule
            %
            
            cofintintb1 =  modelbase.data(2,1); cofintintb2 = modelbase.data(3,1); cofintintb3 = modelbase.data(4,1); cofintintb4 = modelbase.data(5,1);
            cofintinf0 = modelbase.data(1,2); cofintinfb1 = modelbase.data(2,2); cofintinfb2 = modelbase.data(3,2); cofintinfb3 = modelbase.data(4,2); cofintinfb4 = modelbase.data(5,2);
            cofintinff1 = modelbase.data(6,2); cofintinff2 = modelbase.data(7,2); cofintinff3 = modelbase.data(8,2); cofintinff4 = modelbase.data(9,2);
            cofintout = modelbase.data(1,3); cofintoutb1 = modelbase.data(2,3); cofintoutb2 = modelbase.data(3,3); cofintoutb3 = modelbase.data(4,3); cofintoutb4 = modelbase.data(5,3);
            cofintoutf1 = modelbase.data(6,3); cofintoutf2 = modelbase.data(7,3); cofintoutf3 = modelbase.data(8,3); cofintoutf4 = modelbase.data(9,3);
            cofintoutp = modelbase.data(1,4); cofintoutpb1 = modelbase.data(2,4); cofintoutpb2 = modelbase.data(3,4); cofintoutpb3 = modelbase.data(4,4); cofintoutpb4 = modelbase.data(5,4);
            cofintoutpf1 = modelbase.data(6,4); cofintoutpf2 = modelbase.data(7,4); cofintoutpf3 = modelbase.data(8,4); cofintoutpf4 = modelbase.data(9,4);
            std_r_ = 1;
            std_r_quart = 0.25;
            disp(' ')
            disp('Selected Policy Rule:');
            disp(deblank(modelbase.rulenames(i,:)));
        elseif  i==2
            %
            % Original Model-Specific Policy Rule
            %
            coeff_vec=MSR_COEFFS(modelbase.modelchosen);
            cofintintb1 =  coeff_vec(1); cofintintb2 = coeff_vec(2); cofintintb3 = coeff_vec(3); cofintintb4 = coeff_vec(4);
            cofintinf0 = coeff_vec(5); cofintinfb1 = coeff_vec(6); cofintinfb2 = coeff_vec(7); cofintinfb3 = coeff_vec(8); cofintinfb4 = coeff_vec(9);
            cofintinff1 = coeff_vec(10); cofintinff2 = coeff_vec(11); cofintinff3 = coeff_vec(12); cofintinff4 = coeff_vec(13);
            cofintout = coeff_vec(14); cofintoutb1 = coeff_vec(15); cofintoutb2 = coeff_vec(16); cofintoutb3 = coeff_vec(17); cofintoutb4 = coeff_vec(18);
            cofintoutf1 = coeff_vec(19); cofintoutf2 =  coeff_vec(20); cofintoutf3 = coeff_vec(21); cofintoutf4 = coeff_vec(22);
            cofintoutp = coeff_vec(23); cofintoutpb1 = coeff_vec(24); cofintoutpb2 = coeff_vec(25); cofintoutpb3 = coeff_vec(26); cofintoutpb4 = coeff_vec(27);
            cofintoutpf1 = coeff_vec(28); cofintoutpf2 =  coeff_vec(29); cofintoutpf3 = coeff_vec(30); cofintoutpf4 = coeff_vec(31);
            std_r_ = coeff_vec(32);
            std_r_quart = coeff_vec(33);
            disp(' ')
            disp('Selected Policy Rule:');
            disp('Model Specific Policy Rule');
            
        end
        %%
        
        %**********************************************************************************************************************
        %                                DON'T CHANGE ANYTHING AFTER THIS LINE                                                %
        %**********************************************************************************************************************
        
        cd('..');
        cd MODELS
        save policy_param.mat cofintintb1 cofintintb2 cofintintb3 cofintintb4...
            cofintinf0 cofintinfb1 cofintinfb2 cofintinfb3 cofintinfb4 cofintinff1 cofintinff2 cofintinff3 cofintinff4...
            cofintout cofintoutb1 cofintoutb2 cofintoutb3 cofintoutb4 cofintoutf1 cofintoutf2 cofintoutf3 cofintoutf4...
            cofintoutp cofintoutpb1 cofintoutpb2 cofintoutpb3 cofintoutpb4 cofintoutpf1 cofintoutpf2 cofintoutpf3 cofintoutpf4...
            std_r_ std_r_quart ;
        cd('..');
        cd MMB_OPTIONS
        % disp(' ')
        % disp('Selected Policy Rule:');
        % disp(deblank(modelbase.rulenames(modelbase.rule,:)));
        
        %**********************************************************************************************************************
        %                    Solving the Model, Computing Statistics                                                          %
        %**********************************************************************************************************************
        save Modelbase modelbase                                % neccessary to save in between as dynare clears the workspace
        epsilon=1;
        %tic
        modelbase.modeltime(modelbase.models(epsilon)) = cputime;
		if modelbase.OSenvironment == 0;
        	modelbase.setpath(modelbase.models(epsilon),:) = [modelbase.uphomepath num2str('\MODELS\') num2str(modelbase.names(modelbase.models(epsilon),:))]; % path for dynare file of specific model
        else
			modelbase.setpath(modelbase.models(epsilon),:) = [modelbase.uphomepath num2str('/MODELS/') strtrim(modelbase.names(modelbase.models(epsilon),:))]; % path for dynare file of specific model
		end

		modelbase.epsilon = epsilon;
        al=deblank(modelbase.names(modelbase.models(epsilon),:));
        modelbase.AL=strcmp(al(end-1:end),'AL');
        
        if modelbase.AL
            if modelbase.l==min(find(modelbase.rule>0)) % If the model is solved for the first rule chosen
                control=0;
                while control==0
                    gain=str2num(selectgain(modelbase.names,modelbase.models,epsilon));
                    if gain>=0 && gain<=0.05
                        control=1;
                    end
                end
                modelbase.control=control;
                modelbase.gain=gain;
                modelbase.ModelGAIN(modelbase.models(epsilon))=modelbase.gain;
            end
        end
        
        save -append Modelbase modelbase
        cd(modelbase.setpath(modelbase.models(epsilon),:));                                 % go to directory of specific model
        disp(' ');
        disp(['Currently Solving: ', num2str(deblank(modelbase.names((modelbase.models(epsilon)),:)))]);
        eval(['dynare '  modelbase.names(modelbase.models(epsilon),:) ' noclearall']);% solve model "epsilon" in dynare by running the .mod file --> translates Dynare syntax into .m file, that is run
        %eval(['dynare '  modelbase.names(modelbase.models(epsilon),:) ' noclearall']);
        cd('..');
        cd('..'); % insert one more cd('..');
        cd MMB_OPTIONS
        load Modelbase
        options_.ar=100;
        if modelbase.AL
            if modelbase.l==min(find(modelbase.rule>0)) % If the model is solved for the first rule chosen
                thepath=cd;
                cd(modelbase.setpath(modelbase.models(epsilon),:))
                load AL_Info
                cd(thepath);
                AL_.forwards = AL_Info.forwards;
                if ismember(modelbase.rule,[6 7])
                    AL_.states = AL_Info.states_short;
                else
                    AL_.states = AL_Info.states_long;
                end
                %menu for selection of states for learning
                control_sel_states=0;
                while control_sel_states==0
                    rb_temp=menu_AL_select_states;
                    if sum(rb_temp)==1
                        control_sel_states=1;
                    end
                end
                if rb_temp(2)==1
                    while control_sel_states==1
                        rb2_temp=menu_AL_select_subset(AL_.states);
                        if size(rb2_temp,2)~=0
                            control_sel_states=2;
                            AL_.states=rb2_temp;
                        end
                    end
                end
                modelbase.AL_=AL_;
                modelbase.ModelStates(modelbase.models(epsilon))={modelbase.AL_.states};
            end
        end
        
        save -append Modelbase modelbase 
        modelbase=stoch_simul_MMB(modelbase);                                     % solve model
        cd(modelbase.homepath);                                                   % go back to main directory
        %toc
        modelbase.modeltime(modelbase.models(modelbase.epsilon))=cputime-modelbase.modeltime(modelbase.models(modelbase.epsilon));
        disp(['Elapsed cputime is ' ,num2str(modelbase.modeltime(modelbase.models(modelbase.epsilon))), ' seconds.']);
        
        %**********************************************************************************************************************
        %                    Display Variances on screen                                                                    %
        %**********************************************************************************************************************
        
    end
end
statusbar(0, 'Busy...');
if modelbase.option(5) == 1
    
    disp(' ')
    disp('Variance of the model variables you have chosen:')
    disp(' ')
    for i=1:size(modelbase.rulenames,1)
        if (modelbase.rule(i)>0) % If the i-th rule has been chosen
            modelbase.l=i;
            j=modelbase.models;
            if modelbase.info(modelbase.l)==0
                disp(' ')
                disp([num2str(deblank(modelbase.names(modelbase.models,:))) ': ' num2str(modelbase.rulenamesshort1(modelbase.l,:))]);
                disp(' ')
                disp('Variables           Variance       ')
                %Plotting the variance of interest rate
                vname='Interest ';
                var = modelbase.VAR.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:))))(loc(modelbase.VARendo_names.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),'interest'),loc(modelbase.VARendo_names.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),'interest'));
                st = sprintf('%9s %19f',...
                    vname,var);
                disp(st)
                %Plotting the variance of inflation
                vname='Inflation';
                var = modelbase.VAR.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:))))(loc(modelbase.VARendo_names.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),'inflation'),loc(modelbase.VARendo_names.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),'inflation'));
                st = sprintf('%9s %19f',...
                    vname,var);
                disp(st)
                %Plotting the variance of outputgap
                vname='outputgap';
                var = modelbase.VAR.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:))))(loc(modelbase.VARendo_names.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),'outputgap'),loc(modelbase.VARendo_names.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),'outputgap'));
                st = sprintf('%9s %19f',...
                    vname,var);
                disp(st)
                if loc(modelbase.VARendo_names.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),'output')~=0
                    %Plotting the variance of output
                    vname='output   ';
                    var = modelbase.VAR.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:))))(loc(modelbase.VARendo_names.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),'output'),loc(modelbase.VARendo_names.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),'output'));
                    st = sprintf('%9s %19f',...
                        vname,var);
                    disp(st)
                end;
            end;
        end;
    end
end
%**********************************************************************************************************************
%                    Set up figures, plot results                                                                     %
%**********************************************************************************************************************
keyvariables = ['outputgap'; 'inflation'; 'interest '; 'output   '];
titlekeyvariables={'Output Gap';'Inflation';'Interest Rate';'Output'};
if modelbase.option(2)==1
    for i=1:size(modelbase.rulenames,1)
        if (modelbase.rule(i)>0) % If the i-th rule has been chosen
            modelbase.l=i;
            if ~modelbase.info(modelbase.l)
                modelbase.rulelegend=[modelbase.rulelegend; modelbase.rulenamesshort(modelbase.l,:)];
                modelbase.str = cellstr(modelbase.rulelegend);
                time = (0:modelbase.horizon)';
                %remove auxiliary endo variables
                if (i== min(find(modelbase.info==0)))
                    All_Endo_Var           = modelbase.IRFendo_names.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:))));
                    All_Endo_IRF           = modelbase.IRF.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:))));
                    Index_Non_Aux_Var      = find(cellfun(@isempty,strfind(cellstr(All_Endo_Var),'AUX_ENDO'))==1);
                    IRFendo_names_Non_Aux  = All_Endo_Var(Index_Non_Aux_Var,:);
                    IRFendo_names_Non_Aux_0= IRFendo_names_Non_Aux;
                    number=size(Index_Non_Aux_Var,1);
                end
                IRF_Non_Aux_Var       = modelbase.IRF.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:))))(Index_Non_Aux_Var,:,:);
                
                if modelbase.option(3)==1
                    modelbase.namesshocks(1,:)='Combined shocks      ';
                    modelbase=rmfield(modelbase,'innos');
                    modelbase.innos(1,:)='Combined_Shocks';
                end
                
                for p=1:size(modelbase.innos,1)
                    if modelbase.option(4)==1
                        try
                            figure(modelbase.figHandle{p,1});
                            set(modelbase.figHandle{p,1}, 'visible', 'off')
                        catch
                            modelbase.figHandle{p,1}=figure;
                            warning off
                            orient landscape
                            set(modelbase.figHandle{p,1}, 'visible', 'off')
                        end
                        To_be_plotted=Index_Non_Aux_Var;
                        IRF_Non_Aux_Var=modelbase.IRF.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:))))(To_be_plotted,:,:);
                        IRFendo_names_Non_Aux = All_Endo_Var(To_be_plotted,:);
                        for pp=1:4
                            if loc(IRFendo_names_Non_Aux,keyvariables(pp,:))~=0
                                subplot(2,2,pp)
                                plot(time,IRF_Non_Aux_Var(loc(IRFendo_names_Non_Aux,keyvariables(pp,:)),:,p),modelbase.myrulecolor(modelbase.l,:),'LineWidth',2,'MarkerSize',5); hold on
                                grid on
                                title(titlekeyvariables(pp,:),'FontUnits','normalized')
                                if pp==1
                                    if p==2
                                        legend(modelbase.str);
                                    else
                                        legend(modelbase.str, 'location','SouthEast');
                                    end
                                end
                            end
                        end
                    else
                        [IRF_Non_Aux_Var,IRFendo_names_Non_Aux]=Get_IRF_VAR(p,modelbase.l,i, modelbase.rulenames,modelbase.rule,modelbase.info,modelbase.rulenamesshort1,modelbase.IRF,Index_Non_Aux_Var,All_Endo_Var,10^(-5));
                        number(p)=size(IRFendo_names_Non_Aux,1);
                        rest=number(p)-floor(number(p)/9)*9;
                        for q=1:floor(number(p)/9)+(rest~=0)
                            n_var=9*(floor(number(p)/9)>=q)*(q>0)+rest*(floor(number(p)/9)<q);
                            try
                                figure(modelbase.figHandle{p,q});
                                set(modelbase.figHandle{p,q}, 'visible', 'off');
                            catch
                                modelbase.figHandle{p,q}=figure('name',modelbase.innos(p,:));
                                set(modelbase.figHandle{p,q}, 'visible', 'off');
                                warning off
                                orient landscape
                            end
                            for r=1:n_var
                                subplot(3,3,r)
                                plot(modelbase.time,IRF_Non_Aux_Var((q-1)*9+r,:,p),modelbase.myrulecolor(modelbase.l,:),'LineWidth',2,'MarkerSize',5); hold on
                                if r==1
                                    legend(modelbase.str);
                                end
                                grid on
                                title(num2str(deblank(IRFendo_names_Non_Aux((q-1)*9+r,:))),'FontUnits','normalized')
                            end;
                        end;
                    end;
                end;
            end;
        end
    end
end


% save the results
for p=1:size(modelbase.innos,1)
    if ~isempty(find(modelbase.info == 0))
        modelbase.rulerank=0;
        if modelbase.option(3)==1
            jj=(p==1);
            p=1;
            modelbase.namesshocks(p,:)='Combined shocks      ';
        end
        n=max(size(find(modelbase.info==0)))+2;
        for i=1:size(modelbase.rulenames,1)
            if (modelbase.rule(i)>0) % If the i-th rule has been chosen
                modelbase.l=i;
                modelbase.rulerank=modelbase.rulerank+(~modelbase.info(modelbase.l));
                if modelbase.info(modelbase.l) == 0
                    for k = 1:size(keyvariables,1);
                        if (i==min(find(modelbase.info==0)))
                            result.IRF.(num2str(deblank(modelbase.innos(p,:))))((k-1)*n+1,:) = [{keyvariables(k,:)},num2cell(NaN(1,(modelbase.horizon+1)))];
                        end
                        [IRF_Non_Aux_Var,IRFendo_names_Non_Aux]=Get_IRF_VAR(p,modelbase.l,i, modelbase.rulenames,modelbase.rule,modelbase.info,...
                            modelbase.rulenamesshort1,modelbase.IRF,Index_Non_Aux_Var,All_Endo_Var,10^(-5));
                        if  (loc(IRFendo_names_Non_Aux,keyvariables(k,:))~=0)
                            result.IRF.(num2str(deblank(modelbase.innos(p,:))))((k-1)*n+1+modelbase.rulerank,1:(modelbase.horizon+2))=...
                                [{num2str(deblank(modelbase.rulenamesshort(modelbase.l,:)))},num2cell(IRF_Non_Aux_Var(loc(IRFendo_names_Non_Aux,keyvariables(k,:)),1:(modelbase.horizon+1),p))];
                        else
                            result.IRF.(num2str(deblank(modelbase.innos(p,:))))((k-1)*n+1+modelbase.rulerank,2:modelbase.horizon+2) = {[]};
                        end
                    end
                end
                if (i==min(find(modelbase.info==0)))
                    try
                        ListStates=modelbase.ModelStates(modelbase.models(j));
                        result.AL = [{num2str(deblank(modelbase.names(modelbase.models(j),:)))},...
                            {'Gain'},{num2str(modelbase.ModelGAIN(modelbase.models(j)))},...
                            {'States'}, ListStates{:}];
					  	if modelbase.OSenvironment == 0;	
                        	xlswrite(modelbase.savepath, result.AL, 'AL','A1');
						else
							xlwrite(modelbase.savepath, result.AL, 'AL','A1'); %Storing results under UNIX
						end
                    catch
                    end
                end
            end
        end
        if (modelbase.option(3)==1)&&(jj==1)
			if modelbase.OSenvironment == 0;
            	xlswrite(modelbase.savepath, result.IRF.(num2str(deblank(modelbase.innos(p,:)))), ['IRF ' modelbase.namesshocks(p,:)]);
			else
				xlwrite(modelbase.savepath, deblank(eval(['result.IRF.' strtrim(modelbase.innos(p,:))])) , strtrim(['IRF' modelbase.namesshocks(p,:)]),'A1');
			end
        elseif (modelbase.option(3)~=1)
			if modelbase.OSenvironment == 0;
            	xlswrite(modelbase.savepath, result.IRF.(num2str(deblank(modelbase.innos(p,:)))), ['IRF ' modelbase.namesshocks(p,:)]);
			else
				xlwrite(modelbase.savepath, deblank(eval(['result.IRF.' strtrim(modelbase.innos(p,:))])) , strtrim(['IRF' modelbase.namesshocks(p,:)]),'A1');
			end
        end
    end
end
modelbase.rulerank=0;

if modelbase.option(1) ==1
    if ~isempty(find(modelbase.info == 0))
        for i=1:size(modelbase.rulenames,1)
            n=max(size(find(modelbase.info==0)))+2;
            if (modelbase.rule(i)>0) % If the i-th rule has been chosen
                modelbase.l=i;
                modelbase.rulerank=modelbase.rulerank+(~modelbase.info(modelbase.l));
                for k = 1:size(keyvariables,1);
                    if (modelbase.info(modelbase.l) == 0)
                        if (i==min(find(modelbase.info==0)))
                            result.AC((k-1)*n+1,:) = [{keyvariables(k,:)},num2cell(NaN(1,(modelbase.horizon+1)))];
                        end
                        if loc(modelbase.AUTendo_names.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),keyvariables(k,:))~=0
                            result.AC((k-1)*n+1+modelbase.rulerank,1:(modelbase.horizon+2)) =[{num2str(deblank(modelbase.rulenamesshort(modelbase.l,:)))},...
                                num2cell(modelbase.AUTR.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:))))...
                                (loc(modelbase.AUTendo_names.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),keyvariables(k,:)),1:(modelbase.horizon+1)))];
                        end
                    end
                end
                if (i==min(find(modelbase.rule>0)))
                    try
                        ListStates=modelbase.ModelStates(modelbase.models(j));
                        result.AL = [{num2str(deblank(modelbase.names(modelbase.models(j),:)))},...
                            {'Gain'},{num2str(modelbase.ModelGAIN(modelbase.models(j)))},...
                            {'States'}, ListStates{:}];
						if modelbase.OSenvironment == 0;
                        	xlswrite(modelbase.savepath, result.AL, 'AL','A1');
						else
							xlwrite(modelbase.savepath, result.AL, 'AL','A1');
						end
                    catch
                    end
                end
            end
        end
		if modelbase.OSenvironment == 0;
        	xlswrite(modelbase.savepath, result.AC, 'ACF');
		else
			xlwrite(modelbase.savepath, result.AC, 'ACF');
		end
    end
end
%Saving the IRFs of all variables in Excel

for p=1:size(modelbase.innos,1)
    if ~isempty(find(modelbase.info == 0))
        modelbase.rulerank=0;
        m=max(size(find(modelbase.info==0)))+2;
        for i=1:size(modelbase.rulenames,1)
            if (modelbase.rule(i)>0) % If the i-th rule has been chosen
                modelbase.l=i;
                if modelbase.info(modelbase.l)==0
                    modelbase.rulerank=modelbase.rulerank+1;
                    [IRF_Non_Aux_Var,IRFendo_names_Non_Aux]=Get_IRF_VAR(p,modelbase.l,i, modelbase.rulenames,modelbase.rule,modelbase.info,modelbase.rulenamesshort1,modelbase.IRF,Index_Non_Aux_Var,All_Endo_Var,10^(-5));
                    if ~isempty(IRFendo_names_Non_Aux)
                        for v=1:size(IRFendo_names_Non_Aux,1)
                            if (i==min(find(modelbase.info==0)))
                                result.allIRFs.(num2str(deblank(modelbase.innos(p,:))))((v-1)*m+1,1:(modelbase.horizon+2)) = [{IRFendo_names_Non_Aux(v,:)},num2cell(NaN(1,(modelbase.horizon+1)))];
                            end
                            result.allIRFs.(num2str(deblank(modelbase.innos(p,:))))((v-1)*m+modelbase.rulerank+1,1:(modelbase.horizon+2)) =...
                                [{num2str(deblank(modelbase.rulenamesshort(modelbase.l,:)))}, num2cell(IRF_Non_Aux_Var(v,1:(modelbase.horizon+1),p))];
                        end;
                    end;
                end;
            end;
        end;
		if modelbase.OSenvironment == 0;
        	xlswrite(modelbase.savepath, result.allIRFs.(num2str(deblank(modelbase.innos(p,:)))), ['all IRFs ' num2str(deblank(modelbase.namesshocks(p,:)))]);
		else
			xlwrite(modelbase.savepath, result.allIRFs.(num2str(deblank(modelbase.innos(p,:)))), ['all IRFs ' num2str(deblank(modelbase.namesshocks(p,:)))]);
		end
    end;
end;
try
    j=1;
    ListStates=modelbase.ModelStates(modelbase.models(j));
    result.AL = [{num2str(deblank(modelbase.names(modelbase.models(j),:)))},...
        {'Gain'},{num2str(modelbase.ModelGAIN(modelbase.models(j)))},...
        {'States'}, ListStates{:}];
	if modelbase.OSenvironment == 0;
        	xlswrite(modelbase.savepath, result.AL, 'AL','A1');
	else
			xlwrite(modelbase.savepath, result.AL, 'AL','A1');
	end

    
catch
end

if ~isempty(find(modelbase.info==0))
    model_name=num2str(deblank(modelbase.namesplot(modelbase.modelplottedIRF,:)));
    if modelbase.option(2)==1
        for p=1:size(modelbase.innos,1)
            if modelbase.option(4)==1
                figure(modelbase.figHandle{p,1});
                if  p==1
                    if modelbase.option(3)==0 % Check for model specific combined shock option
                        if  modelbase.option(6)==0 % Check if model specific shocks are declared, if yes use their names for the first figure
                            set_figures(modelbase.figHandle{p,1},4,1,[model_name,': IRF to Mon. Pol. Shock']);
                        else
                            set_figures(modelbase.figHandle{p,1},4,1,[model_name,': IRF to ', num2str(deblank(modelbase.namesshocks(p,:)))]);
                        end
                    else
                        set_figures(modelbase.figHandle{p,1},4,1,[model_name,': IRF to selected shocks (contemporenously)']);
                    end
                else
                    set_figures(modelbase.figHandle{p,1},4,1,[model_name,': IRF to ', num2str(deblank(modelbase.namesshocks(p,:)))]);
                    
                end;
            elseif modelbase.option(4)==0
                rest=number(p)-floor(number(p)/9)*9;q1=(floor(number(p)/9)>0);
                for q=1:floor(number(p)/9)+(rest~=0)
                    n_var=9*(floor(number(p)/9)>=q)*(q>0)+rest*(floor(number(p)/9)<q);
                    figure(modelbase.figHandle{p,q});
                    if modelbase.option(3)==1
                        set_figures(modelbase.figHandle{p,q},n_var,2,[model_name,': IRF to selected shocks (contemporenously)']);
                    else
                        set_figures(modelbase.figHandle{p,q},n_var,2,[model_name,': IRF  to ',num2str(deblank(modelbase.namesshocks(p,:)))]);
                    end
                end;
            end;
        end;
    end;
    %%
    
    
    warning off
    if modelbase.option(1)==1
        % plot autocorrelation function
        time = (0:modelbase.horizon)';
        for i=1:size(modelbase.rulenames,1)
            if (modelbase.rule(i)>0) % If the i-th rule has been chosen
                modelbase.l=i;
                if (i== min(find(modelbase.info==0)))
                    modelbase.figHandleACF=figure;
                    set(modelbase.figHandleACF, 'visible', 'off');
                    warning off
                    orient landscape
                end
                if modelbase.info(modelbase.l)==0
                    modelbase.rulelegend=[modelbase.rulelegend; modelbase.rulenamesshort(modelbase.l,:)];
                    modelbase.str = cellstr(modelbase.rulelegend);
                    figure(modelbase.figHandleACF);
                    set(modelbase.figHandleACF, 'visible', 'off');
                    for pp=1:4
                        if loc(modelbase.AUTendo_names.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),keyvariables(pp,:))~=0
                            subplot(2,2,pp)
                            plot(time,modelbase.AUTR.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:))))(loc(modelbase.AUTendo_names.(num2str(deblank(modelbase.rulenamesshort1(modelbase.l,:)))),keyvariables(pp,:)),:), modelbase.myrulecolor(modelbase.l,:),'LineWidth',2,'MarkerSize',5); hold on
                            grid on
                            title(titlekeyvariables(pp,:),'FontUnits','normalized')
                            if pp==1
                                legend(modelbase.str);
                            end
                        end
                    end
                    
                end
            end
        end
        set_figures(modelbase.figHandleACF,4,1,[model_name,': Autocorrelation Functions']);
    end
end
try
    modelbase=rmfield(modelbase,'figHandle');
    modelbase=rmfield(modelbase,'figHandleACF');
catch
end
save -append Modelbase modelbase
modelbase.totaltime = cputime-modelbase.totaltime;
disp(' '); disp(' ');
disp(['Total elapsed cputime: ' ,num2str(modelbase.totaltime), ' seconds.']);
statusbar(0, '');
rmpath(modelbase.homepath);
cd('..');

% command to display a specific impulse response:
% here ACEL as an example which can be replaced by any element (all models which have been solved) of modelbase.names
%modelbase.IRF.ACEL1tech(loc(modelbase.IRFendo_names.ACEL1tech,'ytildef_t'),:)'