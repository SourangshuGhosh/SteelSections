function varargout = Proceed_To_Design_Unsupp(varargin)
% PROCEED_TO_DESIGN_UNSUPP MATLAB code for Proceed_To_Design_Unsupp.fig
%      PROCEED_TO_DESIGN_UNSUPP, by itself, creates a new PROCEED_TO_DESIGN_UNSUPP or raises the existing
%      singleton*.
%
%      H = PROCEED_TO_DESIGN_UNSUPP returns the handle to a new PROCEED_TO_DESIGN_UNSUPP or the handle to
%      the existing singleton*.
%
%      PROCEED_TO_DESIGN_UNSUPP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROCEED_TO_DESIGN_UNSUPP.M with the given input arguments.
%
%      PROCEED_TO_DESIGN_UNSUPP('Property','Value',...) creates a new PROCEED_TO_DESIGN_UNSUPP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Proceed_To_Design_Unsupp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Proceed_To_Design_Unsupp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Proceed_To_Design_Unsupp

% Last Modified by GUIDE v2.5 26-Jun-2014 18:03:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Proceed_To_Design_Unsupp_OpeningFcn, ...
                   'gui_OutputFcn',  @Proceed_To_Design_Unsupp_OutputFcn, ...
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


% --- Executes just before Proceed_To_Design_Unsupp is made visible.
function Proceed_To_Design_Unsupp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Proceed_To_Design_Unsupp (see VARARGIN)

% Choose default command line output for Proceed_To_Design_Unsupp
handles.output = hObject;

    factored_shear=getappdata(0,'a');
    factored_moment=getappdata(0,'b');
    effective_span=getappdata(0,'c');
    deflection_check=getappdata(0,'d');
    imperfection_factor=getappdata(0,'e');
    yield_stress=getappdata(0,'f');
    partial_safety_factor=getappdata(0,'g');
    youngs_modulus=getappdata(0,'h');
    set(handles.factoredshear,'string',factored_shear);
    set(handles.factoredmoment,'string',factored_moment);
    set(handles.effectivespan,'string',effective_span);
    set(handles.valuefordeflection,'string',deflection_check);
    set(handles.steelsectiontype,'string',imperfection_factor);
    set(handles.yieldstress,'string',yield_stress);
    set(handles.safetyfactor,'string',partial_safety_factor);
    set(handles.youngsmodulus,'string',youngs_modulus);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Proceed_To_Design_Unsupp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Proceed_To_Design_Unsupp_OutputFcn(hObject, eventdata, handles) 
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
set(Proceed_To_Design_Unsupp,'visible','off');
Unsupp_Beam_Design;

% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(Proceed_To_Design_Unsupp,'visible','off');
Thank_You;

% --- Executes on button press in proceed.
function proceed_Callback(hObject, eventdata, handles)
% hObject    handle to proceed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(Proceed_To_Design_Unsupp,'Visible','off');
if(get(handles.r2,'Value'))
    Section_Check_Unsupp;
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
       moment_of_inertia_z=[66.1	72.7	76	123.8	164.7	168	257.5	186.7	270	332.1	479.3	356.8	471.1	406.8	416.4	449	780.7	719.9	688.2	697.2	726.4	779.4	1308.5	1096.2	1148.4	1223.3	1272	1696.6	1509.4	1725.5	1819.3	1455.3	1540	1635.6	2235.4	2501.9	2547.9	2694.6	2624.5	3687.9	3717.8	3441.8	3816.8	3920.5	3608.4	5721.8	5375.3	6047.9	5131.6	6362.6	5478.8	5943.1	5478.8	7332.9	9312.6	8603.6	10008	7983.9	9874.6	8983.9	9821.6	13989.5	13158.3	13630.3	15083.8	12545.2	12950.2	15521.7	19306.3	20458	19159.7	19802.8	23426.7	27536.1	3039.8	28083.5	28823.5	35057.6	38579	39210.8	40349.9	45218.3	53161.6	52290.9	53161.6	64893.6	74906.8	91813	115626.6	106198.5];
       plastic_modulus = [20.61	22.35	24.17	28.38	38.09	38.89	41.68	43.83	49.08	49.57	64.22	65.45	72.04	73.93	77.15	81.85	90.89	94.22	104.5	106.07	110.48	119.82	134.15	143.30	150.36	161.65	166.08	184.34	194.20	198.77	211.25	215.64	232.52	251.64	253.86	254.72	260.13	277.93	293.99	338.11	338.69	348.27	356.72	389.93	397.23	414.23	443.09	465.71	466.73	496.77	515.82	527.57	542.22	554.32	622.95	651.74	672.19	678.73	687.76	708.43	731.21	825.02	851.11	889.57	891.03	921.68	962.18	995.49	1099.45	1176.18	1213.53	1268.69	1290.19	1401.35	1533.36	1556.33	1626.36	1760.59	1773.67	1955.03	2030.95	2074.67	2228.16	2351.35	2711.98	2798.56	3066.29	3510.63	3986.66	4341.63];
       radius_of_gyration=[1.26	1.14	1.21	1.42	1.57	1.12	1.05	1.49	1.60	1.01	0.97	2.05	1.73	1.69	1.92	1.62	1.17	1.88	1.75	2.37	1.66	2.21	1.58	1.93	2.38	2.23	1.86	2.13	2.59	2.37	2.23	3.54	3.44	3.35	2.15	1.94	2.62	2.38	2.99	2.89	2.33	2.34	2.38	3.22	4.51	4.42	2.61	2.65	2.87	2.61	4.96	4.06	4.84	2.80	2.82	2.84	2.83	5.49	3.05	5.37	4.02	2.81	3.17	2.84	2.83	5.41	5.29	4.03	3.15	2.84	5.34	5.22	4.04	3.20	3.01	5.26	5.16	4.11	3.34	5.18	5.08	3.52	3.48	4.96	3.73	3.79	5.11	4.12	5.25	5.35];
       moment_of_inertia_y=[11.5	10	12.6	14.9	24.8	12.7	40.8	25.9	25.7	9.2	9.7	57.2	37.9	43.4	59.9	43.7	17.3	50.5	55.2	103.2	52.6	102.3	40.5	79.6	126.5	121	85	115.4	188.6	146.9	140.4	431.7	460.3	494.9	150	112.7	209.5	187.2	328.8	298.4	193.4	218.3	219.8	448.6	967.1	994.6	287	346	334.5	310.8	1396.6	857.5	1396.6	376.2	394.6	453.9	430.6	2011.7	510.8	2011.7	990.1	460.8	631.9	537.7	504.8	2193.6	2246.7	1175.9	716.4	622.1	2451.4	2510	1388	853	834	2728.3	2783	1706.7	1063.9	2985.2	3045	1369.8	1335.5	2987.8	1335.32	1833.8	3740.6	2651	5298.3	4702.5];
       
       factored_shear=getappdata(0,'a');
       factored_moment=getappdata(0,'b');
       effective_span=getappdata(0,'c');
       deflection_check=getappdata(0,'d');
       steel_section_type=getappdata(0,'e');
       yield_stress=getappdata(0,'f');
       partial_safety_factor=getappdata(0,'g');
       youngs_modulus=getappdata(0,'h');
    
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
        
       zp=(1.3*1000*factored_moment*partial_safety_factor/yield_stress);
       
       fprintf(file,'Selection of suitable section:\n\n');
       fprintf(file,'Plastic Section modulus required=');
       fprintf(file,'%.2f × 10^3 cu.mm. \n\n',zp);
    
% SELECTION OF SUITABLE SECTION

       
       test_case =0;
       pos=0;
   
       fprintf(file,'Designing for economical beam w.r.t above section modulus :\n');
  
   while(test_case<90)
       
       test_case=test_case+1;
       pos=pos+1;
       if(pos==91)
        break;
       end;
       for i= pos:91
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
       m_o_i_z=moment_of_inertia_z(pos);
       m_o_i_y=moment_of_inertia_y(pos);
       r_o_g=radius_of_gyration(pos);
       
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
       
       
%{ 
    ADEQUECY OF THE SECTION
       
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
%}    
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

%check for design bending strength

        fprintf(file,'\n\b Check for Design Bending Strength\n\n');

        rigidity_modulus=.5*youngs_modulus/(1.3);
        l_lt=effective_span*1000;
        torsional_constant=2*w_o_f*t_o_f*t_o_f*t_o_f/3+(d_o_s-t_o_f)*t_o_w*t_o_w*t_o_w/3;
        beta_f=0.5;
        h_f=d_o_s-t_o_f; % centre to centre distance between flanges
        m_o_i_y=m_o_i_y*10000;
        i_w=(1-beta_f)*beta_f*m_o_i_y*h_f*h_f;
        m_cr=0.000001*sqrt((pi*pi*youngs_modulus*m_o_i_y/(l_lt*l_lt))*(rigidity_modulus*torsional_constant+(pi*pi*youngs_modulus*i_w)/(l_lt*l_lt)));
        if(section_classification==1||section_classification==2)
            beta_b=1;
        else beta_b=s_m/zp;
        end;
        lembda_lt=sqrt(beta_b*zp*yield_stress/(m_cr*1000));
        lembda_lt_max=sqrt(1.2*s_m*yield_stress/(m_cr*1000));
        alpha_lt=steel_section_type;
        phi_lt=.5*(1+alpha_lt*(lembda_lt-0.2)+lembda_lt*lembda_lt);
        xi_lt=1/(phi_lt+sqrt(phi_lt*phi_lt-lembda_lt*lembda_lt));
        f_bd=xi_lt*yield_stress/partial_safety_factor;
        m_d=beta_b*zp*f_bd/1000;
        
        fprintf(file,'Rigidity Modulus,G                            = %.2f × 10^3 N/mm^3\n',rigidity_modulus/1000);
        fprintf(file,'Young"s Modulus,E                             = %.2f × 10^5 N/mm^3\n',youngs_modulus/100000);
        fprintf(file,'Effective Length,L_lt                         = %.2f mm\n',l_lt);
        fprintf(file,'Torsional Constant,I_t                        = %.2f × 10^6 mm^4\n',torsional_constant/1000000);
        fprintf(file,'Warping Constant,I_w                          = %.2f × 10^12 mm^6\n',i_w/1000000000000);
        fprintf(file,'Lateral Torsional Buckling Moment,M_cr        = %.2f kNm\n',m_cr);
        
        if(lembda_lt<=lembda_lt_max)
            fprintf(file,'Non-Dimensional Slenderness Ratio,lembda_lt   = %.2f <= %.2f \n',lembda_lt,lembda_lt_max);
        else
            lembda_lt=lembda_lt_max;
            fprintf(file,'Non-Dimensional Slenderness Ratio,lembda_lt   = %.2f \n',lembda_lt);
        end;
        
        if(steel_section_type==.21)
            fprintf(file,'Imperfection Parameter,Alpha_lt               = %.2f, section is rolled\n',alpha_lt);
        else
            fprintf(file,'Imperfection Parameter,Alpha_lt               = %.2f, section is welded\n',alpha_lt);
        end;
        
        fprintf(file,'Phi_lt                                        = %.2f \n',phi_lt);
        fprintf(file,'Bending Stress Reduction Factor,Xi_lt         = %.2f\n',xi_lt);
        fprintf(file,'Design Bending Compressive Stress,f_bd        = %.2f N/mm^2\n',f_bd);
        fprintf(file,'Design Bending Capacity,M_d                   = %.2f kNm\n',m_d);
        
        if(m_d<factored_moment)
            
            fprintf(file,'\nFactored Moment applied is greater than Design bending capacity of the section \n');
            fprintf(file,'Abandoning this section and choosing another....\n ');
            continue;
        
        end;
        
        fprintf(file,'\nSo,Design Bending Capacity is greater than applied Factored Moment\nwhich is all right!\n');
%{
    CHECK FOR DESIGN BENDING STRENGTH OF SECTION    
    
        fprintf(file,'\n\b Check for design bending strength of section\n\n');
        h_by_tf=d_o_s/t_o_f;
        e_s_r=.85*effective_span/r_o_g;     %Effective slenderness ratio
        ptr1=0;
        ptr2=0;
        flag=0;
        if(h_by_tf>=8 && h_by_tf<10)
            ptr1=1;
            flag=8;
        elseif(h_by_tf>=10 && h_by_tf<12)
            ptr1=2;
            flag=10;
        elseif(h_by_tf>=12 && h_by_tf<14)
            ptr1=3;
            flag=12;
        elseif(h_by_tf>=14 && h_by_tf<16)
            ptr1=4;
            flag=14;
        elseif(h_by_tf>=16 && h_by_tf<18)
            ptr1=5;
            flag=16;
        elseif(h_by_tf>=18 && h_by_tf<20)
            ptr1=6;
            flag=18;
        elseif(h_by_tf>=20 && h_by_tf<25)
            ptr1=7;
            flag=20;
        elseif(h_by_tf>=25 && h_by_tf<30)
            ptr1=8;
            flag=25;
        elseif(h_by_tf>=30 && h_by_tf<35)
            ptr1=9;
            flag=30;
        elseif(h_by_tf>=35 && h_by_tf<40)
            ptr1=10;
            flag=35;
        elseif(h_by_tf>=40 && h_by_tf<50)
            ptr1=11;
            flag=40;
        elseif(h_by_tf>=50 && h_by_tf<60)
            ptr1=12;
            flag=50;
        elseif(h_by_tf>=60 && h_by_tf<80)
            ptr1=13;
            flag=60;
        elseif(h_by_tf>=80 && h_by_tf<100)
            ptr1=14;
            flag=80;
        end;
        ptr2=int32(e_s_r*10);
        ptr1;
       
        critical_stress_table=[
        22551.2	22255.1	22092.6	21994.1	21929.8	21885.7	21854	21805.4	21779	21763.1	21752.7	21740.5	21733.8	21727.2	21724.2
        6220.5	5947.9	5794.5	5700	5637.8	5594.7	5563.8	5515.8	5489.7	5473.8	5463.5	5451.4	5444.8	5438.2	5435.1
        3149.3	2905.9	2764.6	2676	2616.7	2575.3	2545.3	2498.5	2472.8	2457.1	2447.0	2434.9	2428.3	2421.7	2418.6
        2036.1	1821.2	1693.0	1610.8	1555.1	1515.8	1487	1441.7	1416.5	1401.1	1391.0	1379	1372.5	1365.9	1362.8
        1492.9	1303.2	1187.3	1111.8	1059.9	1022.7	995.3	951.7	927.1	912.0	902.0	890.2	883.7	877.1	874.2
        1178	1009.5	905.0	835.6	787.4	752.4	726.4	684.6	660.9	646.1	636.4	624.7	618.2	611.7	608.7
        973.9	823.2	728.5	664.8	620.1	587.4	562.9	522.9	500.0	485.5	476.0	464.4	458.0	451.7	448.7
        831.3	695.4	609.2	550.7	509.1	478.4	455.3	417.2	395.1	381.2	371.8	360.5	354.1	347.7	344.7
        725.9	602.6	523.6	469.5	430.9	402.2	380.4	344.2	322.9	309.3	300.2	289.1	282.8	276.5	273.5
        644.7	532.0	459.3	409.3	373.2	346.4	325.8	291.4	270.9	257.7	248.8	237.9	231.8	225.5	222.5
        580.4	476.6	409.3	362.9	329.2	303.9	284.5	251.8	232.1	219.3	210.8	200.1	194.0	187.8	184.8
        527.9	431.9	369.5	326.0	294.5	270.7	252.3	221.2	202.4	190.1	181.6	171.2	165.2	159.1	156.2
        484.3	395.0	336.8	296.1	266.5	244.1	226.7	197.1	179.0	167.1	158.8	148.6	142.8	136.7	133.9
        447.6	364.2	309.5	271.5	243.4	222.3	205.8	177.5	160.2	148.7	140.7	130.8	125.0	119.0	116.2
        416.0	337.8	286.6	250.6	224.2	204.2	188.4	161.5	144.8	133.7	126.0	116.3	110.6	104.7	101.9
        388.7	315.2	266.8	232.8	207.8	188.8	173.9	148.2	132.0	121.3	113.9	104.3	98.8	93.0	90.1
        364.9	295.4	249.6	217.5	193.7	175.6	161.4	136.7	121.3	111.0	103.6	94.4	89.0	83.2	80.4
        343.9	278.0	234.6	204.1	181.5	164.2	150.6	127.1	112.2	102.2	95.2	86.0	80.7	75.0	72.3
        325.2	262.6	221.3	192.3	170.7	154.2	141.2	118.6	104.3	94.6	87.8	79.0	73.7	68.1	65.3
        308.3	248.8	209.6	181.7	161.2	145.4	133.0	111.3	97.5	88.1	81.4	72.8	67.8	62.2	59.5
        293.3	236.5	198.9	172.4	152.7	137.6	125.7	104.8	91.5	82.4	75.9	67.5	62.6	57.1	54.5
        279.5	225.3	189.3	163.9	145.1	130.6	119.1	99.0	86.2	77.4	71.2	62.9	58.1	52.7	50.1
        267.1	215.2	180.7	156.3	138.2	124.3	113.3	93.9	81.5	72.9	66.9	58.9	54.1	48.8	46.2
        255.8	205.8	172.8	149.4	132.0	118.6	108.0	89.3	77.2	69.0	63.1	55.3	50.6	45.4	42.8
        245.3	197.3	165.6	143.0	126.3	113.4	103.2	85.1	73.5	65.5	59.7	52.1	47.5	42.4	39.8
        235.7	189.5	159.0	137.3	121.1	108.7	98.8	81.3	70.1	62.3	56.7	49.3	44.8	39.7	37.2
        226.8	182.3	152.8	131.9	116.3	104.3	94.7	77.9	67.0	59.4	53.9	46.8	42.2	37.3	34.8
        218.6	175.7	147.2	126.9	111.9	100.2	91.1	74.7	64.1	56.8	51.5	44.4	40.0	35.2	32.7
        210.9	169.4	141.9	122.3	107.8	96.6	87.7	71.8	61.5	54.3	49.2	42.2	38.1	33.2	30.8
        203.8	163.7	137.1	118.1	104.1	93.2	84.5	69.1	59.1	52.1	47.1	40.4	36.2	31.5	29.0];

        % Extreme fiber compressive elastic lateral buckling stress
        ptr2
        ptr1
        
        val1=critical_stress_table(ptr2:ptr2,ptr1:ptr1);
        val2=critical_stress_table(ptr2+1:ptr2+1,ptr1:ptr1);
        val3=critical_stress_table(ptr2:ptr2,ptr1+1:ptr1+1);
        val4=critical_stress_table(ptr2+1:ptr2+1,ptr1+1:ptr1+1);
    
        val5=val1-mod(e_s_r,10)*(val1-val2)/10;
        val6=val3-mod(e_s_r,10)*(val3-val4)/10;
        
        f_cr_b=val5-(val6-val5)*(h_by_tf-flag);
        lembda_lt=sqrt(yield_stress/f_cr_b);
        alpha_lt=steel_section_type;
        phi_lt=0.5*(1+alpha_lt*(lembda_lt-0.2)+lembda_lt*lembda_lt);
        xi_lt=1/(phi_lt+sqrt(phi_lt*phi_lt-lembda_lt*lembda_lt));
        if(xi_lt>1)
            xi_lt=1;
        end;
        f_b_d=xi_lt*yield_stress/partial_safety_factor
        
        beta_b;
        zp;
        m_d=0.001*beta_b*zp*f_b_d;
        fprintf(file,'Design bending strength of the section is %.2f \n',m_d);
%}       
        
% CHECK FOR DEFLECTION

        fprintf(file,'\nCheck for deflection\n\n');
        
        def_beam=deflection_check/m_o_i_z;
        allowable_deflection=effective_span/.15;
        
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
        
        
        
        
        
        
        
        
    
