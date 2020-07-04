function varargout = Proceed_To_Design(varargin)
% PROCEED_TO_DESIGN MATLAB code for Proceed_To_Design.fig
%      PROCEED_TO_DESIGN, by itself, creates a new PROCEED_TO_DESIGN or raises the existing
%      singleton*.
%
%      H = PROCEED_TO_DESIGN returns the handle to a new PROCEED_TO_DESIGN or the handle to
%      the existing singleton*.
%
%      PROCEED_TO_DESIGN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROCEED_TO_DESIGN.M with the given input arguments.
%
%      PROCEED_TO_DESIGN('Property','Value',...) creates a new PROCEED_TO_DESIGN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Proceed_To_Design_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Proceed_To_Design_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Proceed_To_Design

% Last Modified by GUIDE v2.5 31-May-2014 23:33:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Proceed_To_Design_OpeningFcn, ...
                   'gui_OutputFcn',  @Proceed_To_Design_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Proceed_To_Design is made visible.
function Proceed_To_Design_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Proceed_To_Design (see VARARGIN)

% Choose default command line output for Proceed_To_Design
handles.output = hObject;

    fac_shr=getappdata(0,'a');
    fac_mom=getappdata(0,'b');
    fac_spn=getappdata(0,'c');
    def_check=getappdata(0,'g');
    fy=getappdata(0,'d');
    psf=getappdata(0,'e');
    yng=getappdata(0,'f');
    set(handles.shr,'string',fac_shr);
    set(handles.mom,'string',fac_mom);
    set(handles.span,'string',fac_spn);
    set(handles.def,'string',def_check);
    set(handles.yld,'string',fy);
    set(handles.sfac,'string',psf);
    set(handles.yng,'string',yng);
    
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Proceed_To_Design wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Proceed_To_Design_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(Proceed_To_Design,'Visible','off');
Beam_design;

% --- Executes on button press in proceed.
function proceed_Callback(hObject, eventdata, handles)
% hObject    handle to proceed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(Proceed_To_Design,'Visible','off');

if(get(handles.r2,'Value'))
   
    Section_Check; 

elseif(get(handles.r1,'Value'))
    
       success=0;
       weight_per_meter=[5.7 6.1	6.8	5.8	7.9	8.0	8.9	9.2	7.9	7.1	8.1	10.7	9.9	11.9	12.7	13	9.9	11.2	14.2	14.4	14.9	16.4	12.8	16.7	17.6	19.1	19.3	19.8	22.1	20.6	22.1	27.1	30.6	34.6	25.4	23.5	24	25.9	28.8	28.0	27.9	31.2	30.4	33.9	37.3	40.0	33	37.3	33.1	35.8	43.1	40.9	46.8	37.7	38.8	44.2	42.1	51.0	43.1	54.7	48.1	45.7	49.5	52.4	49.4	58.8	63.0	56.9	56.9	61.5	67.4	72.4	66.7	65.3	72.4	77.4	82.2	79.4	75	87.2	92.5	86.9	86.3	95.2	103.7	99.5	112.5	122.6	133.7	145.1];
       sectional_area=[7.26	7.71	8.67	7.41	10.02	10.21	11.4	11.7	10.07	9.01	10.28	13.67	12.65	15.1	16.19	16.6	12.64	14.24	18.08	18.36	19	20.88	16.28	21.30	22.40	24.38	24.62	25.27	28.11	26.22	28.21	34.48	38.98	44.08	32.33	29.92	30.53	33.01	36.71	35.65	35.53	39.72	38.67	43.24	47.54	50.94	42.02	47.55	42.11	45.64	54.94	52.05	59.66	48.08	49.47	56.26	53.66	64	54.90	69.71	61.33	58.25	63.01	66.70	62.93	74.85	80.25	72.50	72.43	78.40	85.91	92.21	85.01	83.14	92.27	98.66	104.66	101.15	95.50	111.14	117.89	110.74	109.97	121.22	132.11	126.07	143.34	156.21	170.38	184.86];
       depth_of_section=[75	75	75	100	100	100	100	100	125	150	175	125	150	125	125	125	200	175	150	150	150	150	225	175	175	175	175	200	175	200	200	150	150	150	200	225	225	225	200	250	250	225	250	225	200	200	275	250	300	300	225	250	225	300	350	300	350	250	325	250	300	400	350	350	400	300	300	350	400	400	350	350	400	450	450	400	400	450	500	450	450	500	550	500	550	600	550	600	600	600]; 
       width_of_flange=[40	50	40	45	50	50	50	50	50	50	50	65	55	75	65	75	60	60	80	75	80	75	80	90	75	75	90	100	125	75	75	150	150	150	100	100	90	80	140	100	125	110	80	150	200	200	140	125	100	90	225	200	225	150	100	140	100	250	165	250	200	100	165	140	100	250	250	200	165	140	250	250	200	170	150	250	250	200	180	250	250	180	190	250	190	210	250	210	250	250];
       thickness_of_flange=[6.0	5.0	7.3	5.1	6.4	6.4	7.0	7.5	6.6	4.6	4.6	6.6	6.9	6.5	8.1	7.6	5.0	6.9	6.8	7.8	7.6	9.0	5.0	6.9	9.5	10.2	8.6	7.3	7.4	10.8	11.4	9.0	9.0	9.0	10.8	8.6	10.2	12.4	9.0	10.7	8.2	11.8	14.1	9.9	9.0	9.0	8.8	12.5	11.6	13.6	9.1	9.0	9.1	9.4	12.5	12.4	13.5	9.7	9.8	9.7	10.0	14.0	11.4	14.2	15.3	10.6	10.6	11.4	12.5	16.0	11.6	11.6	13.0	13.4	17.4	12.7	12.7	15.4	14.1	13.7	13.7	17.2	15.0	14.7	19.3	15.5	17.6	20.8	21.3	23.6];
       thickness_of_web=[3.7	3.7	4.4	3.0	4.0	4.0	4.2	4.7	3.0	3.0	3.0	4.4	3.6	4.4	5.0	4.4	3.4	3.6	4.8	4.8	4.8	5.4	3.7	5.1	5.1	5.7	5.5	5.4	5.8	5.5	6.1	5.4	8.4	11.8	5.7	5.8	5.8	6.4	6.1	6.1	6.1	6.5	7.1	6.4	6.1	7.8	6.4	6.9	6.7	7.6	6.5	6.7	8.6	6.7	7.4	7.5	8.1	6.9	7.0	8.8	7.4	8.0	7.4	8.1	8.6	7.6	9.4	8.0	8	8.9	8.3	10.1	8.6	8.6	9.4	9.1	10.6	9.2	9.2	9.8	11.3	10.2	9.9	9.9	11.2	10.5	10.5	12	11.2	11.8];
       section_modulus=[17.6	19.4	20.8	24.8	32.9	33.6	36.6	37.3	43.2	42.9	54.8	57.1	62.8	65.1	66.6	71.8	78.1	82.3	91.8	93.0	96.9	103.9	116.3	125.3	131.3	139.8	145.4	169.7	172.5	172.6	181.9	194.1	205.3	218.1	223.5	222.4	226.5	239.5	262.5	295.0	297.4	305.9	305.3	348.5	360.8	372.2	392.4	410.5	403.2	424.2	469.3	475.4	487.0	488.9	532.1	573.6	571.9	618.9	607.7	638.7	654.8	699.5	751.9	779.0	754.1	836.3	863.3	887.0	965.3	1020	1094.8	1131.6	1171.3	1223.8	1350.7	1404.2	1444.2	1558.1	1543.2	1742.7	1793.3	1808.7	1933.2	2091.6	2359.8	2428.9	2723.9	3060.4	3540	3854.2];
       depth_of_web=[51	52	43.4	77.8	75.2	73.2	68	67	99.8	130.8	155.8	97.8	122.2	96	89.8	91.8	180	147.2	117.4	118.4	116.8	112	202	142.2	140	133.6	137.8	166.4	144.2	161.4	155.2	116	116	116	156.4	183.8	182.6	176.2	164	206.6	207.6	177.4	197.8	187.2	164	164	229.4	252.8	199	246.8	186.8	212	186.8	251.2	299	247.2	295	210.6000	273.4	210.6	258	334	295.2	293.6	339.4	256.8	256.8	303.2	343	340	302.8	302.8	348	391.2	385.2	346.6	346.6	391.2	437.8	392.6000	392.6	431.6	484	440.6	475.4	529	482.8	518.4	521.4	518.8]; 
       moment_of_inertia=[66.1	72.7	76	123.8	164.7	168	257.5	186.7	270	332.1	479.3	356.8	471.1	406.8	416.4	449	780.7	719.9	688.2	697.2	726.4	779.4	1308.5	1096.2	1148.4	1223.3	1272	1696.6	1509.4	1725.5	1819.3	1455.3	1540	1635.6	2235.4	2501.9	2547.9	2694.6	2624.5	3687.9	3717.8	3441.8	3816.8	3920.5	3608.4	5721.8	5375.3	6047.9	5131.6	6362.6	5478.8	5943.1	5478.8	7332.9	9312.6	8603.6	10008	7983.9	9874.6	8983.9	9821.6	13989.5	13158.3	13630.3	15083.8	12545.2	12950.2	15521.7	19306.3	20458	19159.7	19802.8	23426.7	27536.1	3039.8	28083.5	28823.5	35057.6	38579	39210.8	40349.9	45218.3	53161.6	52290.9	53161.6	64893.6	74906.8	91813	115626.6	106198.5];
       plastic_modulus = [20.61	22.35	24.17	28.38	38.09	38.89	41.68	43.83	49.08	49.57	64.22	65.45	72.04	73.93	77.15	81.85	90.89	94.22	104.5	106.07	110.48	119.82	134.15	143.30	150.36	161.65	166.08	184.34	194.20	198.77	211.25	215.64	232.52	251.64	253.86	254.72	260.13	277.93	293.99	338.11	338.69	348.27	356.72	389.93	397.23	414.23	443.09	465.71	466.73	496.77	515.82	527.57	542.22	554.32	622.95	651.74	672.19	678.73	687.76	708.43	731.21	825.02	851.11	889.57	891.03	921.68	962.18	995.49	1099.45	1176.18	1213.53	1268.69	1290.19	1401.35	1533.36	1556.33	1626.36	1760.59	1773.67	1955.03	2030.95	2074.67	2228.16	2351.35	2711.98	2798.56	3066.29	3510.63	3986.66	4341.63];

    
       factored_shear=getappdata(0,'a');
       factored_moment=getappdata(0,'b');
       yield_stress=getappdata(0,'d');
       def_check=getappdata(0,'g');
       partial_safety_factor=getappdata(0,'e');
       effective_span=getappdata(0,'c');
       youngs_modulus=getappdata(0,'f');
            
       file = fopen('Output.doc','w');
       fprintf(file,'Inputs:\n\n');
       fprintf(file,'Factored shear is                             %.2f kN\n',factored_shear);
       fprintf(file,'factored moment is                            %.2f kNm\n',factored_moment);
       fprintf(file,'Effective span is                             %.2f m\n',effective_span);
       fprintf(file,'yield stress is                               %.2f Mpa\n',yield_stress);
       fprintf(file,'Partial safety factor governed yielding is    %.2f\n',partial_safety_factor);
       fprintf(file,'Young''s modulus of the material given is      %.2f N/sq.m.\n',youngs_modulus);
       fprintf(file,'\n\n***********************************************************************\n');
    

% TAKING INPUT OF BEAM NAMES
     
    strArray = java_array('java.lang.String',90);
    strArray(1) = java.lang.String('ISLC 75');
    strArray(2) = java.lang.String('ISLB 75');
    strArray(3) = java.lang.String('ISMC 75');
    strArray(4) = java.lang.String('ISJC 100');
    strArray(5) = java.lang.String('ISLC 100');
    strArray(6) = java.lang.String('ISLB 100');
    strArray(7) = java.lang.String('ISMB 100');
    strArray(8) = java.lang.String('ISMC 100');
    strArray(9) = java.lang.String('ISJC 125');
    strArray(10) = java.lang.String('ISJB 150');
    strArray(11) = java.lang.String('ISJB 175');
    strArray(12) = java.lang.String('ISLC 125');
    strArray(13) = java.lang.String('ISJC 150');
    strArray(14) = java.lang.String('ISLB 125');
    strArray(15) = java.lang.String('ISMC 125');
    strArray(16) = java.lang.String('ISMB 125');
    strArray(17) = java.lang.String('ISJB 200');
    strArray(18) = java.lang.String('ISJC 175');
    strArray(19) = java.lang.String('ISLB 150');
    strArray(20) = java.lang.String('ISLC 150');
    strArray(21) = java.lang.String('ISMB 150');
    strArray(22) = java.lang.String('ISMC 150');
    strArray(23) = java.lang.String('ISJB 225');
    strArray(24) = java.lang.String('ISLB 175');
    strArray(25) = java.lang.String('ISLC 175');
    strArray(26) = java.lang.String('ISMC 175');
    strArray(27) = java.lang.String('ISMB 175');
    strArray(28) = java.lang.String('ISLB 200');
    strArray(29) = java.lang.String('ISWB 175');
    strArray(30) = java.lang.String('ISLC 200');
    strArray(31) = java.lang.String('ISMC 200');
    strArray(32) = java.lang.String('ISHB 150');
    strArray(33) = java.lang.String('ISHB 150');
    strArray(34) = java.lang.String('ISHB 150');
    strArray(35) = java.lang.String('ISMB 200');
    strArray(36) = java.lang.String('ISLB 225');
    strArray(37) = java.lang.String('ISLC 225');
    strArray(38) = java.lang.String('ISMC 225');
    strArray(39) = java.lang.String('ISWB 200');
    strArray(40) = java.lang.String('ISLC 250');
    strArray(41) = java.lang.String('ISLB 250');
    strArray(42) = java.lang.String('ISMB 225');
    strArray(43) = java.lang.String('ISMC 250');
    strArray(44) = java.lang.String('ISWB 225');
    strArray(45) = java.lang.String('ISHB 200');
    strArray(46) = java.lang.String('ISHB 200');
    strArray(47) = java.lang.String('ISLB 275');
    strArray(48) = java.lang.String('ISMB 250');
    strArray(49) = java.lang.String('ISLC 300');
    strArray(50) = java.lang.String('ISMC 300');
    strArray(51) = java.lang.String('ISHB 225');
    strArray(52) = java.lang.String('ISWB 250');
    strArray(53) = java.lang.String('ISHB 225');
    strArray(54) = java.lang.String('ISLB 300');
    strArray(55) = java.lang.String('ISLC 350');
    strArray(56) = java.lang.String('ISMB 300');
    strArray(57) = java.lang.String('ISMC 350');
    strArray(58) = java.lang.String('ISHB 250');
    strArray(59) = java.lang.String('ISLB 325');
    strArray(60) = java.lang.String('ISHB 250');
    strArray(61) = java.lang.String('ISWB 300');
    strArray(62) = java.lang.String('ISLC 400');
    strArray(63) = java.lang.String('ISLB 350');
    strArray(64) = java.lang.String('ISMB 350');
    strArray(65) = java.lang.String('ISMC 400');
    strArray(66) = java.lang.String('ISHB 300');
    strArray(67) = java.lang.String('ISHB 300');
    strArray(68) = java.lang.String('ISWB 350');
    strArray(69) = java.lang.String('ISLB 400');
    strArray(70) = java.lang.String('ISMB 400');
    strArray(71) = java.lang.String('ISHB 350');
    strArray(72) = java.lang.String('ISHB 350');
    strArray(73) = java.lang.String('ISWB 400');
    strArray(74) = java.lang.String('ISLB 450');
    strArray(75) = java.lang.String('ISMB 450');
    strArray(76) = java.lang.String('ISHB 400');
    strArray(77) = java.lang.String('ISHB 400');
    strArray(78) = java.lang.String('ISWB 450');
    strArray(79) = java.lang.String('ISLB 500');
    strArray(80) = java.lang.String('ISHB 450');
    strArray(81) = java.lang.String('ISHB 450');
    strArray(82) = java.lang.String('ISMB 500');
    strArray(83) = java.lang.String('ISLB 550');
    strArray(84) = java.lang.String('ISWB 500');
    strArray(85) = java.lang.String('ISMB 550');
    strArray(86) = java.lang.String('ISLB 600');
    strArray(87) = java.lang.String('ISWB 550');
    strArray(88) = java.lang.String('ISMB 600');
    strArray(89) = java.lang.String('ISWB 600');
    strArray(90) = java.lang.String('ISWB 600');
    cellArray = cell(strArray);
     
% SECTION MODULUS
        
       zp=(1000*factored_moment*partial_safety_factor/yield_stress);
       
       fprintf(file,'Selection of suitable section:\n\n');
       fprintf(file,'Plastic Section modulus required=');
       fprintf(file,'%.2f × 10^3 cu.mm. \n\n',zp);
       
% SELECTION OF SUITABLE SECTION

       
       test_case =0;
       pos=1;
   
       fprintf(file,'Designing for economical beam w.r.t above section modulus :\n');
  
   while(test_case<89)
       
       test_case=test_case+1;
       
       for i= pos:90
           if(zp<plastic_modulus(i))
           zp=plastic_modulus(i);
           pos=i;
           break;
           end
       end
       
       
       w_p_m=weight_per_meter(pos)*.0098;
       d_o_s=depth_of_section(pos);
       s_a=sectional_area(pos);
       w_o_f=width_of_flange(pos);
       t_o_f=thickness_of_flange(pos);
       t_o_w=thickness_of_web(pos);
       s_m=section_modulus(pos);
       d_o_w=depth_of_web(pos);
       m_o_i=moment_of_inertia(pos);
       
       fprintf(file,'\nTest Beam #%d\n\n',test_case);
       fprintf(file,'Section Chosen is ');
       fprintf(file,'%s',cellArray{pos:pos});
       fprintf(file,' @ %.4f kN/m\n',w_p_m);
       fprintf(file,'\n\b Properties of the section are as follows:\n');
       fprintf(file,'Depth of Section           (h)  = %.0f mm\n',d_o_s);
       fprintf(file,'Width of flange            (b)  = %.0f mm\n',w_o_f);
       fprintf(file,'Thickness of flange        (tb) = %.1f mm\n',t_o_f);
       fprintf(file,'Depth of web               (d)  = %.1f mm\n',d_o_w);
       fprintf(file,'Thickness of web           (tw) = %.1f mm\n',t_o_w);
       fprintf(file,'Elastic Section Modulus    (ze) = %.2f × 10^3 cu.mm.\n',s_m);
       fprintf(file,'Plastic Section Modulus    (zp) = %.2f × 10^3 cu.mm.\n',zp);
        

% SECTION CLASSIFICATION
        
       fprintf(file,'\n\b Section Classification\n');
       
       section_classification=0;
       epsilon= sqrt(250/yield_stress);
       btf=.5*w_o_f/t_o_f;
       dtw=d_o_w/t_o_w;
       btf_plastic_limit=9.4*epsilon;
       btf_compact_limit=10.5*epsilon;
       btf_scompact_limit=15.7*epsilon;
       dtw_plastic_limit=84*epsilon;
       dtw_compact_limit=105*epsilon;
       dtw_scompact_limit=126*epsilon;
       
       fprintf(file,'epsilon = %.2f\n',epsilon);
       fprintf(file,'(b/tf) = %.2f\n',btf);
       fprintf(file,'(d/tw) = %.2f\n\n',dtw);
       
       if(btf<=btf_plastic_limit)
           
           section_classification=1;
           fprintf(file,'(b/tf) < 9.4*epsilon\n');
           fprintf(file,'(d/tw) < 84*epsilon\n');
           fprintf(file,'\nSo, the section is plastic\n');
       
       elseif(btf>btf_plastic_limit & btf<=btf_compact_limit)
           
           section_classification=2;
           fprintf(file,'9.4*epsilon < (b/tf) < 10.5*epsilon\n');
           fprintf(file,'84*epsilon < (d/tw) < 105*epsilon\n');
           fprintf(file,'So, the section is compact\n');
       
       else
           
           section_classification=3;
           fprintf(file,'10.5*epsilon < (b/tf) < 15.7*epsilon\n');
           fprintf(file,'105*epsilon < (d/tw) < 126*epsilon\n');
           fprintf(file,'So, the section is semi-compact\n');
       
       end
       
       
% ADEQUECY OF THE SECTION
       
        fprintf(file,'\n\b Adequecy of the section\n\n');
            
        load_on_beam=factored_moment*8/(effective_span*effective_span);
        fac_self_wt=1.5*w_p_m;
        total_load=fac_self_wt+load_on_beam;
        max_bend_mom=total_load*effective_span*effective_span/8;
        zp_reqd=1000*max_bend_mom*partial_safety_factor/yield_stress;
        
        fprintf(file,'Factored self weight of the beam      = %.4f kN/m\n',fac_self_wt);
        fprintf(file,'Total load acting on the beam         = %.4f kN/m\n',total_load);
        fprintf(file,'Maximum Bending Moment                = %.2f kNm\n',max_bend_mom);
        fprintf(file,'Plastic section modulus required      = %.2f × 10^3 cu.mm.\n',zp_reqd);
        fprintf(file,'Plastic section modulus of the beam   = %.2f × 10^3 cu.mm.\n',zp);
            
        if(zp_reqd>zp)
            
            fprintf(file,'Plastic section modulus applied is greater than that of the beam\n');
            fprintf(file,'Abandoning this section and choosing another....\n ');
            continue;
        
        end;
 
% CALCULATION OF DESIGN SHEAR FORCE
 
        fprintf(file,'\n\b Calculation of shear capacity\n\n');
        
        design_shear_force=factored_shear;
        design_shear_strength_of_section=.001*yield_stress*d_o_s*t_o_w/(partial_safety_factor*(sqrt (3)));
        
        fprintf(file,'Design shear force                 = %.2f kN\n',design_shear_force);
        fprintf(file,'Design shear strength of section   = %.2f kN\n',design_shear_strength_of_section);
        
        if(design_shear_strength_of_section<design_shear_force)
            
            fprintf(file,'Design shear force is greater than design shear strength of section \n');
            fprintf(file,'Abandoning this section and choosing another....\n ');
            continue;
        
        end;
        
        
% CHECK FOR HIGH/LOW SHEAR

        fprintf(file,'\n\b Check for high/low shear\n\n');

        three_fifth_vd=.6*design_shear_strength_of_section;
        shear_check=0;
        
        fprintf(file,'Design shear force = %.2f kN\n',design_shear_force);
        fprintf(file,'0.6Vd              = %.2f kN\n',three_fifth_vd);
        
        
        if(design_shear_force>three_fifth_vd)
            
            shear_check=2;
            fprintf(file,'The case is of high shear\n');
            
        else
            
            shear_check=1;
            fprintf(file,'The case is of low shear\n');
            
        end;

        
% CHECK FOR DESIGN BENDING STRENGTH OF SECTION

        fprintf(file,'\n\b Check for design bending strength of section\n\n');
        if(shear_check==1) % Low Shear
            
            if(section_classification == 3)
            
                beta=s_m/zp;
        
            else

                beta = 1;

            end;
            
            design_bending_strength=.001*(beta*zp)*yield_stress/partial_safety_factor;
            upper_limit_of_design_moment=.0012*s_m*yield_stress/partial_safety_factor;
            
            fprintf(file,'Md = Betab*Zp*fy/Gamma,m0 = %.3f kNm\n',design_bending_strength);
            fprintf(file,'1.2*Ze*fy/Gamma,m0        = %.3f kNm\n',upper_limit_of_design_moment);
            
            if(design_bending_strength>upper_limit_of_design_moment)
                
                fprintf(file,'Design bending strength of the section is more than the limit \n');
                fprintf(file,'Abandoning this section and choosing another....\n ');
                continue;
            
            end;
            
        elseif(shear_check==2)    % High Shear
            
            if(section_classification == 3)     % For Semi-compact section
                
                design_bending_strength_of_semi_compact_section=.001*s_m*yield_stress/partial_safety_factor;
                
                fprintf(file,'Design bending strength of semi-compact section = %.2f kNm\n',design_bending_strength_of_semi_compact_section);
                fprintf(file,'Design bending moment                           = %.2f kNm\n',factored_moment);
                
                if(design_bending_strength_of_semi_compact_section<factored_moment)
                    
                    fprintf(file,'Design bending strength of the semi compact section is less than factored moment \n');
                    fprintf(file,'Abandoning this section and choosing another....\n ');
                    continue;
                    
                end;
                
            else    % For Plastic or Compact section
                
                beta=(2*(design_shear_force/design_shear_strength_of_section)-1);
                beta=beta*beta;
                
                plastic_moment_of_the_whole_section = .001*zp*yield_stress/partial_safety_factor;
                section_modulus_of_flange=zp-.001*d_o_s*d_o_s*t_o_w/4;
                plastic_design_strength_of_csa_excluding_shear_area = .001*section_modulus_of_flange*yield_stress/partial_safety_factor;
                moment_capacity_of_plastic_or_compact_section=plastic_moment_of_the_whole_section-beta*(plastic_moment_of_the_whole_section - plastic_design_strength_of_csa_excluding_shear_area);
                vale=0.0012*s_m*yield_stress/partial_safety_factor;
                
                fprintf(file,'Beta                      = %.4f\n',beta);
                fprintf(file,'Md                        = %.2f kNm\n',plastic_moment_of_the_whole_section);
                fprintf(file,'Zfd                       = %.2f × 10^3 cu.mm.\n',section_modulus_of_flange);
                fprintf(file,'Mfd                       = %.2f kNm\n',plastic_design_strength_of_csa_excluding_shear_area);
                fprintf(file,'Mdv                       = %.2f kNm\n',moment_capacity_of_plastic_or_compact_section);
                fprintf(file,'Design bending moment, M  = %.2f kNm\n',factored_moment);
                fprintf(file,'1.2*Ze*fy/gamma,m0        = %.2f kNm\n',vale);
                    
                if(moment_capacity_of_plastic_or_compact_section<factored_moment | moment_capacity_of_plastic_or_compact_section>vale)
                    
                    if(section_classification==1)
                        
                        fprintf(file,'Design strength of the plastic section is less than required\n');
                        fprintf(file,'Abandoning this section and choosing another....\n ');
                        continue;
                        
                    else
                        
                        fprintf(file,'Design strength of the semi-compact section is less than required\n');
                        fprintf(file,'Abandoning this section and choosing another....\n ');
                        continue;
                        
                    end;
                    
                end;
                
            end;
            
        end
         
% CHECK FOR DEFLECTION

        fprintf(file,'\nCheck for deflection\n\n');
        
        def_beam=def_check/m_o_i;
        allowable_deflection=effective_span/.3;
        
        fprintf(file,'deflection of the beam is           %.2f mm\n',def_beam);
        fprintf(file,'allowable deflection of the beam is %.2f mm\n',allowable_deflection);
        
        if(def_beam>allowable_deflection)
            
            fprintf(file,'Deflection of the beam is more than allowable deflection\n');
            fprintf(file,'Abandoning this section and choosing another....\n ');
            continue;
            
        end;
                
        
% CHECK FOR WEB BUCKLING
        
        fprintf(file,'\nCheck for web buckling\n\n');

        cross_sectional_area_of_buckling=(100+d_o_s/2)*t_o_w;
        l_effective=.7*d_o_w;
        inertia=100*t_o_w*t_o_w*t_o_w/12;
        effective_area_of_web=100*t_o_w;
        rmin=sqrt (inertia/effective_area_of_web);
        lembda=l_effective/rmin;
        ordinate1=int32(.1*lembda);
        ordinate2=ordinate1-1;
                
        
        if(yield_stress==200)
            
            ho=[182	182	172	163	153	142	131	120	108	97.5	87.3	78.2	70.0	62.9	56.6	51.1	46.4	42.2	38.5	35.3	32.4	29.9	27.6	25.6	23.8];
            
        elseif(yield_stress==210)
            
            ho=[191	190	180	170	159	148	136	123	111	100	89.0	79.4	71.0	63.6	57.2	51.6	46.8	42.5	38.8	35.5	32.6	30.1	27.8	25.7	23.9];
            
        elseif(yield_stress==220)
            
            ho=[200	199	188	177	165	153	140	127	114	102	90.5	80.6	71.9	64.4	57.8	52.1	47.1	42.8	C\9.0	35.7	32.8	30.2	27.9	25.9	24.0];
        
        elseif(yield_stress==230)
            
            ho=[209	207	196	184	172	158	144	130	116	104	92.0	81.7	72.8	65.0	58.3	52.5	47.5	43.1	39.3	35.9	33.0	30.4	28.0	26.0	24.1];
            
        elseif(yield_stress==240)
            
            ho=[218	216	204	191	178	163	148	133	119	105	93.3	82.7	73.5	65.6	58.8	52.9	47.8	43.4	39.5	36.1	33.1	30.5	28.2	26.1	24.2];
            
        elseif(yield_stress==250)
            
            ho=[227	224	211	198	183	168	152	136	121	107	94.6	83.7	74.3	66.2	59.2	53.3	48.1	43.6	39.7	36.3	33.3	30.6	28.3	26.2	24.3];
            
        elseif(yield_stress==260)
            
            ho=[236	233	219	205	189	173	156	139	123	109	95.7	84.6	75.0	66.7	59.7	53.6	48.4	43.9	39.9	36.5	33.4	30.8	28.4	26.3	24.4];
            
        elseif(yield_stress==280)
            
            ho=[255	250	234	218	201	182	163	145	127	112	97.9	86.2	76.2	67.7	60.4	54.2	48.9	44.3	40.3	36.8	33.7	31.0	28.6	26.4	24.5];
            
        elseif(yield_stress==300)
            
            ho=[273	266	249	231	212	191	170	149	131	114	100	87.6	77.3	68.6	61.1	54.8	49.3	44.7	40.6	37.0	33.9	31.2	28.8	26.6	24.7];
            
        elseif(yield_stress==320)
            
            ho=[291	283	264	244	222	199	176	154	134	116	102	88.9	78.3	69.3	61.7	55.3	49.8	45.0	40.9	37.3	34.1	31.4	28.9	26.7	24.8];
            
        elseif(yield_stress==340)
            
            ho=[309	299	278	256	232	207	182	158	137	119	103	90.1	79.2	70.0	62.3	55.7	50.1	45.3	41.1	37.5	34.3	31.5	29.1	26.9	24.9];
            
        elseif(yield_stress==360)
            
            ho=[327	316	293	268	242	215	187	162	140	120	104	91.1	80.0	70.7	62.8	56.1	50.5	45.6	41.4	37.7	34.5	31.7	29.2	27.0	25.0];
            
        elseif(yield_stress==380)
            
            ho=[345	332	307	280	252	222	192	165	142	122	106	92.1	80.7	71.2	63.3	56.5	50.8	45.8	41.6	37.9	34.7	31.8	29.3	27.1	25.1];
            
        elseif(yield_stress==400)
            
            ho=[364	348	321	292	261	228	197	169	144	124	107	93.0	81.4	71.8	63.7	56.9	51.1	46.1	41.8	38.1	34.8	31.9	29.4	27.2	25.2];
            
        elseif(yield_stress==420)
            
            ho=[382	364	335	304	270	235	202	172	146	125	108	93.8	82.0	72.3	64.1	57.2	51.3	46.3	42.0	38.2	34.9	32.1	29.5	27.3	25.3];
            
        elseif(yield_stress==450)
            
            ho=[409	388	355	320	282	244	208	176	149	127	110	94.9	82.9	72.9	64.6	57.6	51.7	46.6	42.2	38.4	35.1	32.2	29.7	27.4	25.4];
            
        elseif(yield_stress==480)
            
            ho=[436	412	376	337	295	252	213	180	152	129	111	95.9	83.6	73.5	65.1	58.0	52.0	46.9	42.5	38.6	35.3	32.4	29.8	27.5	25.5];
            
        elseif(yield_stress==510)
            
            ho=[464	435	395	352	306	260	218	183	154	131	112	96.8	84.3	74.1	65.5	58.4	52.3	47.1	42.7	38.8	35.4	32.5	29.9	27.6	25.6];
            
        elseif(yield_stress==540)
            
            ho=[491	458	415	367	317	267	223	186	156	132	113	97.6	84.9	74.6	65.9	58.7	52.6	47.3	42.9	39.0	35.6	32.6	30.0	27.7	25.7];
            
        end;
        
        abscissa1=ho(ordinate1);
        abscissa2=ho(ordinate2);
        design_compressive_stress=abscissa2-((abscissa2-abscissa1)/10)*(mod(lembda,10));
        capacity_of_section=.001*cross_sectional_area_of_buckling*design_compressive_stress;
        
        
        fprintf(file,'Assuming stiff bearing length, b  = 100 mm\n');
        fprintf(file,'Ab                                = %.2f sq.mm.\n',cross_sectional_area_of_buckling);
        fprintf(file,'KL                                = %.2f mm\n',l_effective);
        fprintf(file,'Ieff                              = %.2f mm^4\n',inertia);
        fprintf(file,'Aeff                              = %.2f sq.mm\n',effective_area_of_web);
        fprintf(file,'r                                 = %.2f mm\n',rmin);
        fprintf(file,'lembda                            = %.2f \n',lembda);
        fprintf(file,'fcd                               = %.2f N/sq.mm.\n',design_compressive_stress);
        fprintf(file,'Ab*fcd                            = %.2f kN\n',capacity_of_section);
        fprintf(file,'factored shear force              = %.2f kN\n',design_shear_force);
        
        if(capacity_of_section<design_shear_force)
            
            fprintf(file,'Buckling capacity of the section is less than required\n');
            fprintf(file,'Abandoning this section and choosing another....\n ');
            continue;
        
        end

   
% CHECK FOR WEB CRIPPLING

        fprintf(file,'\nCheck for web crippling\n\n');
        
        n2=2.5*(t_o_f + .5*(d_o_s-d_o_w)-t_o_f);
        f_crippling=.001*(100+n2)*t_o_f*yield_stress;
        
        fprintf(file,'n1                                = %.2f mm\n',n2);
        fprintf(file,'Fw                                = %.2f kN\n',f_crippling);
        fprintf(file,'Design shear force                = %.2f kN\n',design_shear_force);
        
        if(f_crippling<design_shear_force)
            
            fprintf(file,'Bearing capacity of the section is less than required\n');
            fprintf(file,'Abandoning this section and choosing another....\n ');
            continue;
        
        end
        
        fprintf(file,'\n\nResult\t\t\t\t\t\t\t\t\t O.K.');
        fclose(file);
        setappdata(0,'aaa',cellArray{pos:pos});
         Economical_Design;
         success=1;
        break;
   end;
    if(success==0)
    fprintf(file,'\n\n No Suitable beam was obtained\n');
    fclose(file);
    setappdata(0,'aaa','NONE');
    Economical_Design;
    end;
    
end;



% --- Executes during object creation, after setting all properties.
function shr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to shr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function mom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function span_CreateFcn(hObject, eventdata, handles)
% hObject    handle to span (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function shr_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to shr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
