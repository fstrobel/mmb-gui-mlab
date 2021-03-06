function [residual, g1, g2, g3] = NK_CW09_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [M_.exo_nbr by nperiods] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(79, 1);
T3 = (-1);
T189 = (params(37)+(1-params(37))*params(38))*y(113)/y(115)+(1-params(37))*(1-params(38))*y(114)/y(115);
T198 = (1-params(37))*params(38)*y(113)/y(115)+y(114)/y(115)*(params(37)+(1-params(37))*(1-params(38)));
T214 = y(58)^T3;
T219 = y(50)^(-params(42));
T220 = y(57)*params(40)*(1+params(41))*params(49)*y(51)*T214*T219;
T224 = (y(40)/y(54))^(1+params(41));
T268 = (1+y(1))/y(38);
T281 = y(36)^(-params(45));
T287 = y(37)^(-params(46));
T294 = params(67)/params(93)^params(50);
T298 = T294*y(68)+params(76);
T314 = (1-params(44)*y(38)^(params(43)-1))/(1-params(44));
T315 = (1+params(41))*params(43)/(params(43)-1);
T325 = (params(43)-1)/(1+params(41)*params(43));
T348 = 1/params(42);
T349 = (y(36)/params(47))^T348;
T352 = (y(37)/params(48))^T348;
T358 = (y(58)/params(49))^((-(1+params(42)))/params(42));
T570 = params(97)^T3;
T572 = (params(41)+T570)^T3;
T747 = 1/y(38);
T753 = getPowerDeriv(y(36),(-params(45)),1);
T758 = 1/params(47)*getPowerDeriv(y(36)/params(47),T348,1);
T767 = getPowerDeriv(params(38)*T349+(1-params(38))*T352,params(42),1);
T773 = 1/y(115);
T778 = getPowerDeriv(y(37),(-params(46)),1);
T784 = 1/params(48)*getPowerDeriv(y(37)/params(48),T348,1);
T805 = (-(1+y(1)))/(y(38)*y(38));
T812 = (-(params(44)*getPowerDeriv(y(38),params(43)-1,1)))/(1-params(44));
T813 = getPowerDeriv(T314,T315,1);
T824 = (params(37)+(1-params(37))*params(38))*(-y(113))/(y(115)*y(115))+(1-params(37))*(1-params(38))*(-y(114))/(y(115)*y(115));
T828 = (1-params(37))*params(38)*(-y(113))/(y(115)*y(115))+(params(37)+(1-params(37))*(1-params(38)))*(-y(114))/(y(115)*y(115));
T837 = getPowerDeriv(y(40)/y(54),1+params(41),1);
T838 = 1/y(54)*T837;
T847 = getPowerDeriv(y(42)/y(41),T325,1);
T851 = 1/y(41);
T881 = getPowerDeriv(y(50),(-params(42)),1);
T882 = y(57)*params(40)*(1+params(41))*params(49)*y(51)*T214*T881;
T913 = (-y(40))/(y(54)*y(54));
T914 = T837*T913;
T933 = T219*y(57)*params(40)*(1+params(41))*params(49)*y(51)*getPowerDeriv(y(58),T3,1);
T937 = 1/params(49)*getPowerDeriv(y(58)/params(49),(-(1+params(42)))/params(42),1);
T1020 = T3/(y(115)*y(115));
T1055 = getPowerDeriv(y(40)/y(54),1+params(41),2);
T1056 = 1/y(54)*T1055;
T1081 = T913*T913*T1055+T837*(-((-y(40))*(y(54)+y(54))))/(y(54)*y(54)*y(54)*y(54));
T1136 = (-(params(44)*getPowerDeriv(y(38),params(43)-1,2)))/(1-params(44));
T1150 = getPowerDeriv(y(42)/y(41),T325,2);
T1151 = (-y(42))/(y(41)*y(41))*T1150;
T1174 = 1/params(47)*1/params(47)*getPowerDeriv(y(36)/params(47),T348,2);
T1186 = 1/params(48)*1/params(48)*getPowerDeriv(y(37)/params(48),T348,2);
lhs =y(84);
rhs =y(59)*4;
residual(1)= lhs-rhs;
lhs =y(85);
rhs =y(62)+y(14)+y(20)+y(21);
residual(2)= lhs-rhs;
lhs =y(86);
rhs =4*y(62);
residual(3)= lhs-rhs;
lhs =y(87);
rhs =y(63)-y(83);
residual(4)= lhs-rhs;
lhs =y(88);
rhs =y(63);
residual(5)= lhs-rhs;
lhs =y(89);
rhs =y(82);
residual(6)= lhs-rhs;
lhs =y(84);
rhs =params(32)*x(it_, 10)+params(31)*y(129)+params(30)*y(128)+params(29)*y(127)+params(28)*y(120)+params(27)*y(24)+params(26)*y(23)+params(25)*y(22)+params(24)*y(19)+y(88)*params(23)+params(22)*y(126)+params(21)*y(125)+params(20)*y(124)+params(19)*y(119)+params(18)*y(27)+params(17)*y(26)+params(16)*y(25)+params(15)*y(18)+y(87)*params(14)+params(13)*y(123)+params(12)*y(122)+params(11)*y(121)+params(10)*y(118)+params(6)*y(17)+y(86)*params(5)+params(1)*y(16)+params(2)*y(28)+params(3)*y(29)+params(4)*y(30)+params(7)*y(31)+params(8)*y(32)+params(9)*y(33);
residual(7)= lhs-rhs;
lhs =y(89);
rhs =params(34)*x(it_, 11);
residual(8)= lhs-rhs;
residual(9) = (1+y(34))*(1+y(53))*params(35)*T189-y(36);
residual(10) = (1+y(34))*params(35)*T198-y(37);
residual(11) = T220*T224+params(35)*params(44)*y(115)^((1+params(41))*params(43))*y(116)-y(41);
residual(12) = y(40)*y(57)*(1-y(52))+params(35)*params(44)*y(115)^(params(43)-1)*y(117)-y(42);
residual(13) = params(38)*(1-params(38))*y(56)-params(38)*y(55)+params(37)*(y(3)*(1+y(11))+params(38)*y(13))*T268-(1+y(53)*params(38))*y(44);
residual(14) = params(38)*y(49)*T281+(1-params(38))*y(48)*T287+T298*y(44)^params(50)+y(45)-y(40);
residual(15) = params(44)*y(2)*y(38)^((1+params(41))*params(43))+(1-params(44))*T314^T315-y(43);
residual(16) = T314-(y(42)/y(41))^T325;
residual(17) = 1+(1+params(51))*y(46)*y(44)^params(51)+params(50)*T298*y(44)^(params(50)-1)-(1+y(53));
lhs =y(56);
rhs =y(49)*T281-y(48)*T287-y(43)*T224*T219*y(51)*(T349-T352)*T358;
residual(18)= lhs-rhs;
lhs =y(58);
rhs =params(49)*(params(38)*T349+(1-params(38))*T352)^params(42);
residual(19)= lhs-rhs;
lhs =y(57);
rhs =params(38)*y(36)+(1-params(38))*y(37);
residual(20)= lhs-rhs;
lhs =y(49);
rhs =params(77)*(1-params(55))+params(55)*y(7)+x(it_, 2);
residual(21)= lhs-rhs;
lhs =y(48);
rhs =params(78)*(1-params(54))+params(54)*y(6)+x(it_, 1);
residual(22)= lhs-rhs;
lhs =y(45);
rhs =y(82)+params(95)*(1-params(56))+params(56)*y(4);
residual(23)= lhs-rhs;
lhs =y(50);
rhs =params(88)*(1-params(57))+params(57)*y(8)+x(it_, 3);
residual(24)= lhs-rhs;
lhs =y(51);
rhs =params(80)*(1-params(58))+params(58)*y(9)+x(it_, 4);
residual(25)= lhs-rhs;
lhs =y(52);
rhs =params(81)*(1-params(59))+params(59)*y(10)+x(it_, 5);
residual(26)= lhs-rhs;
lhs =y(68);
rhs =params(61)*y(15)+x(it_, 6);
residual(27)= lhs-rhs;
lhs =y(46);
rhs =params(79)*(1-params(62))+params(62)*y(5)+x(it_, 7);
residual(28)= lhs-rhs;
lhs =y(54);
rhs =params(89)*(1-params(63))+params(63)*y(12)+x(it_, 8);
residual(29)= lhs-rhs;
lhs =y(55);
rhs =params(94)*(1-params(66))+y(13)*params(66)+x(it_, 9);
residual(30)= lhs-rhs;
lhs =(1+y(34))/(1+params(73));
rhs =exp(y(59));
residual(31)= lhs-rhs;
lhs =y(36)/params(82);
rhs =exp(y(60));
residual(32)= lhs-rhs;
lhs =y(37)/params(83);
rhs =exp(y(61));
residual(33)= lhs-rhs;
lhs =y(58)/params(86);
rhs =exp(y(81));
residual(34)= lhs-rhs;
lhs =y(57)/params(87);
rhs =exp(y(80));
residual(35)= lhs-rhs;
lhs =y(38);
rhs =exp(y(62));
residual(36)= lhs-rhs;
lhs =y(40)/params(67);
rhs =exp(y(63));
residual(37)= lhs-rhs;
lhs =y(41)/params(84);
rhs =exp(y(64));
residual(38)= lhs-rhs;
lhs =y(42)/params(85);
rhs =exp(y(65));
residual(39)= lhs-rhs;
lhs =y(43)/params(91);
rhs =exp(y(66));
residual(40)= lhs-rhs;
lhs =y(44)/params(93);
rhs =exp(y(67));
residual(41)= lhs-rhs;
lhs =y(45);
rhs =params(67)*y(69)+params(71);
residual(42)= lhs-rhs;
lhs =y(46);
rhs =params(79)+y(70)/((1+params(51))*params(93)^params(51));
residual(43)= lhs-rhs;
lhs =y(48)/params(78);
rhs =exp(y(71));
residual(44)= lhs-rhs;
lhs =y(49)/params(77);
rhs =exp(y(72));
residual(45)= lhs-rhs;
lhs =y(50)/params(88);
rhs =exp(y(73));
residual(46)= lhs-rhs;
lhs =y(51)/params(80);
rhs =exp(y(74));
residual(47)= lhs-rhs;
lhs =((1-y(52))/(1-params(81)))^T3;
rhs =exp(y(75));
residual(48)= lhs-rhs;
lhs =(1+y(53))/(1+params(74));
rhs =exp(y(76));
residual(49)= lhs-rhs;
lhs =y(54)/params(89);
rhs =exp(y(77));
residual(50)= lhs-rhs;
lhs =y(55);
rhs =params(93)+params(67)*y(78);
residual(51)= lhs-rhs;
lhs =y(79);
rhs =y(59)+y(76);
residual(52)= lhs-rhs;
lhs =y(83);
rhs =T572*(T570*(y(69)+params(72)*(y(72)*params(38)*params(69)/params(72)+y(71)*(1-params(38))*params(70)/params(72)))+params(42)*y(73)+(1+params(41))*y(77));
residual(53)= lhs-rhs;
lhs =y(35);
rhs =y(59)*4;
residual(54)= lhs-rhs;
lhs =y(39);
rhs =4*y(62);
residual(55)= lhs-rhs;
lhs =y(47);
rhs =4*y(76);
residual(56)= lhs-rhs;
lhs =y(90);
rhs =y(118);
residual(57)= lhs-rhs;
lhs =y(91);
rhs =y(121);
residual(58)= lhs-rhs;
lhs =y(92);
rhs =y(122);
residual(59)= lhs-rhs;
lhs =y(93);
rhs =y(119);
residual(60)= lhs-rhs;
lhs =y(94);
rhs =y(124);
residual(61)= lhs-rhs;
lhs =y(95);
rhs =y(125);
residual(62)= lhs-rhs;
lhs =y(96);
rhs =y(120);
residual(63)= lhs-rhs;
lhs =y(97);
rhs =y(127);
residual(64)= lhs-rhs;
lhs =y(98);
rhs =y(128);
residual(65)= lhs-rhs;
lhs =y(99);
rhs =y(14);
residual(66)= lhs-rhs;
lhs =y(100);
rhs =y(20);
residual(67)= lhs-rhs;
lhs =y(101);
rhs =y(19);
residual(68)= lhs-rhs;
lhs =y(102);
rhs =y(22);
residual(69)= lhs-rhs;
lhs =y(103);
rhs =y(23);
residual(70)= lhs-rhs;
lhs =y(104);
rhs =y(18);
residual(71)= lhs-rhs;
lhs =y(105);
rhs =y(25);
residual(72)= lhs-rhs;
lhs =y(106);
rhs =y(26);
residual(73)= lhs-rhs;
lhs =y(107);
rhs =y(16);
residual(74)= lhs-rhs;
lhs =y(108);
rhs =y(28);
residual(75)= lhs-rhs;
lhs =y(109);
rhs =y(29);
residual(76)= lhs-rhs;
lhs =y(110);
rhs =y(17);
residual(77)= lhs-rhs;
lhs =y(111);
rhs =y(31);
residual(78)= lhs-rhs;
lhs =y(112);
rhs =y(32);
residual(79)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(79, 140);

  %
  % Jacobian matrix
  %

  g1(1,59)=(-4);
  g1(1,84)=1;
  g1(2,14)=T3;
  g1(2,62)=T3;
  g1(2,85)=1;
  g1(2,20)=T3;
  g1(2,21)=T3;
  g1(3,62)=(-4);
  g1(3,86)=1;
  g1(4,63)=T3;
  g1(4,83)=1;
  g1(4,87)=1;
  g1(5,63)=T3;
  g1(5,88)=1;
  g1(6,82)=T3;
  g1(6,89)=1;
  g1(7,16)=(-params(1));
  g1(7,84)=1;
  g1(7,17)=(-params(6));
  g1(7,86)=(-params(5));
  g1(7,118)=(-params(10));
  g1(7,18)=(-params(15));
  g1(7,87)=(-params(14));
  g1(7,119)=(-params(19));
  g1(7,19)=(-params(24));
  g1(7,88)=(-params(23));
  g1(7,120)=(-params(28));
  g1(7,139)=(-params(32));
  g1(7,121)=(-params(11));
  g1(7,122)=(-params(12));
  g1(7,123)=(-params(13));
  g1(7,124)=(-params(20));
  g1(7,125)=(-params(21));
  g1(7,126)=(-params(22));
  g1(7,127)=(-params(29));
  g1(7,128)=(-params(30));
  g1(7,129)=(-params(31));
  g1(7,22)=(-params(25));
  g1(7,23)=(-params(26));
  g1(7,24)=(-params(27));
  g1(7,25)=(-params(16));
  g1(7,26)=(-params(17));
  g1(7,27)=(-params(18));
  g1(7,28)=(-params(2));
  g1(7,29)=(-params(3));
  g1(7,30)=(-params(4));
  g1(7,31)=(-params(7));
  g1(7,32)=(-params(8));
  g1(7,33)=(-params(9));
  g1(8,89)=1;
  g1(8,140)=(-params(34));
  g1(9,34)=T189*(1+y(53))*params(35);
  g1(9,36)=T3;
  g1(9,113)=(1+y(34))*(1+y(53))*params(35)*(params(37)+(1-params(37))*params(38))*T773;
  g1(9,114)=(1+y(34))*(1+y(53))*params(35)*(1-params(37))*(1-params(38))*T773;
  g1(9,115)=(1+y(34))*(1+y(53))*params(35)*T824;
  g1(9,53)=T189*(1+y(34))*params(35);
  g1(10,34)=params(35)*T198;
  g1(10,113)=(1+y(34))*params(35)*(1-params(37))*params(38)*T773;
  g1(10,37)=T3;
  g1(10,114)=(1+y(34))*params(35)*(params(37)+(1-params(37))*(1-params(38)))*T773;
  g1(10,115)=(1+y(34))*params(35)*T828;
  g1(11,115)=y(116)*params(35)*params(44)*getPowerDeriv(y(115),(1+params(41))*params(43),1);
  g1(11,40)=T220*T838;
  g1(11,41)=T3;
  g1(11,116)=params(35)*params(44)*y(115)^((1+params(41))*params(43));
  g1(11,50)=T224*T882;
  g1(11,51)=T224*T219*y(57)*params(40)*(1+params(41))*params(49)*T214;
  g1(11,54)=T220*T914;
  g1(11,57)=T224*T219*T214*y(51)*params(49)*params(40)*(1+params(41));
  g1(11,58)=T224*T933;
  g1(12,115)=y(117)*params(35)*params(44)*getPowerDeriv(y(115),params(43)-1,1);
  g1(12,40)=y(57)*(1-y(52));
  g1(12,42)=T3;
  g1(12,117)=params(35)*params(44)*y(115)^(params(43)-1);
  g1(12,52)=y(40)*(-y(57));
  g1(12,57)=y(40)*(1-y(52));
  g1(13,1)=params(37)*(y(3)*(1+y(11))+params(38)*y(13))*T747;
  g1(13,38)=params(37)*(y(3)*(1+y(11))+params(38)*y(13))*T805;
  g1(13,3)=T268*params(37)*(1+y(11));
  g1(13,44)=(-(1+y(53)*params(38)));
  g1(13,11)=T268*params(37)*y(3);
  g1(13,53)=(-(params(38)*y(44)));
  g1(13,13)=T268*params(37)*params(38);
  g1(13,55)=(-params(38));
  g1(13,56)=params(38)*(1-params(38));
  g1(14,36)=params(38)*y(49)*T753;
  g1(14,37)=(1-params(38))*y(48)*T778;
  g1(14,40)=T3;
  g1(14,44)=T298*getPowerDeriv(y(44),params(50),1);
  g1(14,45)=1;
  g1(14,48)=(1-params(38))*T287;
  g1(14,49)=params(38)*T281;
  g1(14,68)=T294*y(44)^params(50);
  g1(15,38)=params(44)*y(2)*getPowerDeriv(y(38),(1+params(41))*params(43),1)+(1-params(44))*T812*T813;
  g1(15,2)=params(44)*y(38)^((1+params(41))*params(43));
  g1(15,43)=T3;
  g1(16,38)=T812;
  g1(16,41)=(-((-y(42))/(y(41)*y(41))*T847));
  g1(16,42)=(-(T847*T851));
  g1(17,44)=(1+params(51))*y(46)*getPowerDeriv(y(44),params(51),1)+params(50)*T298*getPowerDeriv(y(44),params(50)-1,1);
  g1(17,46)=(1+params(51))*y(44)^params(51);
  g1(17,53)=T3;
  g1(17,68)=y(44)^(params(50)-1)*params(50)*T294;
  g1(18,36)=(-(y(49)*T753-y(43)*T224*T219*y(51)*T358*T758));
  g1(18,37)=(-((-(y(48)*T778))-y(43)*T224*T219*y(51)*T358*(-T784)));
  g1(18,40)=y(43)*T219*y(51)*(T349-T352)*T358*T838;
  g1(18,43)=T224*T219*y(51)*(T349-T352)*T358;
  g1(18,48)=T287;
  g1(18,49)=(-T281);
  g1(18,50)=y(43)*T224*y(51)*(T349-T352)*T358*T881;
  g1(18,51)=y(43)*T224*T219*(T349-T352)*T358;
  g1(18,54)=y(43)*T219*y(51)*(T349-T352)*T358*T914;
  g1(18,56)=1;
  g1(18,58)=y(43)*T224*T219*y(51)*(T349-T352)*T937;
  g1(19,36)=(-(params(49)*params(38)*T758*T767));
  g1(19,37)=(-(params(49)*T767*(1-params(38))*T784));
  g1(19,58)=1;
  g1(20,36)=(-params(38));
  g1(20,37)=(-(1-params(38)));
  g1(20,57)=1;
  g1(21,7)=(-params(55));
  g1(21,49)=1;
  g1(21,131)=T3;
  g1(22,6)=(-params(54));
  g1(22,48)=1;
  g1(22,130)=T3;
  g1(23,4)=(-params(56));
  g1(23,45)=1;
  g1(23,82)=T3;
  g1(24,8)=(-params(57));
  g1(24,50)=1;
  g1(24,132)=T3;
  g1(25,9)=(-params(58));
  g1(25,51)=1;
  g1(25,133)=T3;
  g1(26,10)=(-params(59));
  g1(26,52)=1;
  g1(26,134)=T3;
  g1(27,15)=(-params(61));
  g1(27,68)=1;
  g1(27,135)=T3;
  g1(28,5)=(-params(62));
  g1(28,46)=1;
  g1(28,136)=T3;
  g1(29,12)=(-params(63));
  g1(29,54)=1;
  g1(29,137)=T3;
  g1(30,13)=(-params(66));
  g1(30,55)=1;
  g1(30,138)=T3;
  g1(31,34)=1/(1+params(73));
  g1(31,59)=(-exp(y(59)));
  g1(32,36)=1/params(82);
  g1(32,60)=(-exp(y(60)));
  g1(33,37)=1/params(83);
  g1(33,61)=(-exp(y(61)));
  g1(34,58)=1/params(86);
  g1(34,81)=(-exp(y(81)));
  g1(35,57)=1/params(87);
  g1(35,80)=(-exp(y(80)));
  g1(36,38)=1;
  g1(36,62)=(-exp(y(62)));
  g1(37,40)=1/params(67);
  g1(37,63)=(-exp(y(63)));
  g1(38,41)=1/params(84);
  g1(38,64)=(-exp(y(64)));
  g1(39,42)=1/params(85);
  g1(39,65)=(-exp(y(65)));
  g1(40,43)=1/params(91);
  g1(40,66)=(-exp(y(66)));
  g1(41,44)=1/params(93);
  g1(41,67)=(-exp(y(67)));
  g1(42,45)=1;
  g1(42,69)=(-params(67));
  g1(43,46)=1;
  g1(43,70)=(-(1/((1+params(51))*params(93)^params(51))));
  g1(44,48)=1/params(78);
  g1(44,71)=(-exp(y(71)));
  g1(45,49)=1/params(77);
  g1(45,72)=(-exp(y(72)));
  g1(46,50)=1/params(88);
  g1(46,73)=(-exp(y(73)));
  g1(47,51)=1/params(80);
  g1(47,74)=(-exp(y(74)));
  g1(48,52)=T3/(1-params(81))*getPowerDeriv((1-y(52))/(1-params(81)),T3,1);
  g1(48,75)=(-exp(y(75)));
  g1(49,53)=1/(1+params(74));
  g1(49,76)=(-exp(y(76)));
  g1(50,54)=1/params(89);
  g1(50,77)=(-exp(y(77)));
  g1(51,55)=1;
  g1(51,78)=(-params(67));
  g1(52,59)=T3;
  g1(52,76)=T3;
  g1(52,79)=1;
  g1(53,69)=(-(T570*T572));
  g1(53,71)=(-(T572*T570*params(72)*(1-params(38))*params(70)/params(72)));
  g1(53,72)=(-(T572*T570*params(72)*params(38)*params(69)/params(72)));
  g1(53,73)=(-(params(42)*T572));
  g1(53,77)=(-((1+params(41))*T572));
  g1(53,83)=1;
  g1(54,35)=1;
  g1(54,59)=(-4);
  g1(55,39)=1;
  g1(55,62)=(-4);
  g1(56,47)=1;
  g1(56,76)=(-4);
  g1(57,118)=T3;
  g1(57,90)=1;
  g1(58,121)=T3;
  g1(58,91)=1;
  g1(59,122)=T3;
  g1(59,92)=1;
  g1(60,119)=T3;
  g1(60,93)=1;
  g1(61,124)=T3;
  g1(61,94)=1;
  g1(62,125)=T3;
  g1(62,95)=1;
  g1(63,120)=T3;
  g1(63,96)=1;
  g1(64,127)=T3;
  g1(64,97)=1;
  g1(65,128)=T3;
  g1(65,98)=1;
  g1(66,14)=T3;
  g1(66,99)=1;
  g1(67,20)=T3;
  g1(67,100)=1;
  g1(68,19)=T3;
  g1(68,101)=1;
  g1(69,22)=T3;
  g1(69,102)=1;
  g1(70,23)=T3;
  g1(70,103)=1;
  g1(71,18)=T3;
  g1(71,104)=1;
  g1(72,25)=T3;
  g1(72,105)=1;
  g1(73,26)=T3;
  g1(73,106)=1;
  g1(74,16)=T3;
  g1(74,107)=1;
  g1(75,28)=T3;
  g1(75,108)=1;
  g1(76,29)=T3;
  g1(76,109)=1;
  g1(77,17)=T3;
  g1(77,110)=1;
  g1(78,31)=T3;
  g1(78,111)=1;
  g1(79,32)=T3;
  g1(79,112)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(204,3);
  v2(1,1)=9;
  v2(1,2)=15714;
  v2(1,3)=(1+y(53))*params(35)*(params(37)+(1-params(37))*params(38))*T773;
  v2(2,1)=9;
  v2(2,2)=4733;
  v2(2,3)=  v2(1,3);
  v2(3,1)=9;
  v2(3,2)=15854;
  v2(3,3)=(1+y(53))*params(35)*(1-params(37))*(1-params(38))*T773;
  v2(4,1)=9;
  v2(4,2)=4734;
  v2(4,3)=  v2(3,3);
  v2(5,1)=9;
  v2(5,2)=15994;
  v2(5,3)=(1+y(53))*params(35)*T824;
  v2(6,1)=9;
  v2(6,2)=4735;
  v2(6,3)=  v2(5,3);
  v2(7,1)=9;
  v2(7,2)=16073;
  v2(7,3)=(1+y(34))*(1+y(53))*params(35)*(params(37)+(1-params(37))*params(38))*T1020;
  v2(8,1)=9;
  v2(8,2)=15795;
  v2(8,3)=  v2(7,3);
  v2(9,1)=9;
  v2(9,2)=16074;
  v2(9,3)=(1+y(34))*(1+y(53))*params(35)*(1-params(37))*(1-params(38))*T1020;
  v2(10,1)=9;
  v2(10,2)=15935;
  v2(10,3)=  v2(9,3);
  v2(11,1)=9;
  v2(11,2)=16075;
  v2(11,3)=(1+y(34))*(1+y(53))*params(35)*((params(37)+(1-params(37))*params(38))*(-((-y(113))*(y(115)+y(115))))/(y(115)*y(115)*y(115)*y(115))+(1-params(37))*(1-params(38))*(-((-y(114))*(y(115)+y(115))))/(y(115)*y(115)*y(115)*y(115)));
  v2(12,1)=9;
  v2(12,2)=7314;
  v2(12,3)=params(35)*T189;
  v2(13,1)=9;
  v2(13,2)=4673;
  v2(13,3)=  v2(12,3);
  v2(14,1)=9;
  v2(14,2)=7393;
  v2(14,3)=(1+y(34))*params(35)*(params(37)+(1-params(37))*params(38))*T773;
  v2(15,1)=9;
  v2(15,2)=15733;
  v2(15,3)=  v2(14,3);
  v2(16,1)=9;
  v2(16,2)=7394;
  v2(16,3)=(1+y(34))*params(35)*(1-params(37))*(1-params(38))*T773;
  v2(17,1)=9;
  v2(17,2)=15873;
  v2(17,3)=  v2(16,3);
  v2(18,1)=9;
  v2(18,2)=7395;
  v2(18,3)=(1+y(34))*params(35)*T824;
  v2(19,1)=9;
  v2(19,2)=16013;
  v2(19,3)=  v2(18,3);
  v2(20,1)=10;
  v2(20,2)=15714;
  v2(20,3)=params(35)*(1-params(37))*params(38)*T773;
  v2(21,1)=10;
  v2(21,2)=4733;
  v2(21,3)=  v2(20,3);
  v2(22,1)=10;
  v2(22,2)=15854;
  v2(22,3)=params(35)*(params(37)+(1-params(37))*(1-params(38)))*T773;
  v2(23,1)=10;
  v2(23,2)=4734;
  v2(23,3)=  v2(22,3);
  v2(24,1)=10;
  v2(24,2)=15994;
  v2(24,3)=params(35)*T828;
  v2(25,1)=10;
  v2(25,2)=4735;
  v2(25,3)=  v2(24,3);
  v2(26,1)=10;
  v2(26,2)=16073;
  v2(26,3)=(1+y(34))*params(35)*(1-params(37))*params(38)*T1020;
  v2(27,1)=10;
  v2(27,2)=15795;
  v2(27,3)=  v2(26,3);
  v2(28,1)=10;
  v2(28,2)=16074;
  v2(28,3)=(1+y(34))*params(35)*(params(37)+(1-params(37))*(1-params(38)))*T1020;
  v2(29,1)=10;
  v2(29,2)=15935;
  v2(29,3)=  v2(28,3);
  v2(30,1)=10;
  v2(30,2)=16075;
  v2(30,3)=(1+y(34))*params(35)*((1-params(37))*params(38)*(-((-y(113))*(y(115)+y(115))))/(y(115)*y(115)*y(115)*y(115))+(params(37)+(1-params(37))*(1-params(38)))*(-((-y(114))*(y(115)+y(115))))/(y(115)*y(115)*y(115)*y(115)));
  v2(31,1)=11;
  v2(31,2)=16075;
  v2(31,3)=y(116)*params(35)*params(44)*getPowerDeriv(y(115),(1+params(41))*params(43),2);
  v2(32,1)=11;
  v2(32,2)=5500;
  v2(32,3)=T220*1/y(54)*T1056;
  v2(33,1)=11;
  v2(33,2)=16215;
  v2(33,3)=params(35)*params(44)*getPowerDeriv(y(115),(1+params(41))*params(43),1);
  v2(34,1)=11;
  v2(34,2)=16076;
  v2(34,3)=  v2(33,3);
  v2(35,1)=11;
  v2(35,2)=6900;
  v2(35,3)=T838*T882;
  v2(36,1)=11;
  v2(36,2)=5510;
  v2(36,3)=  v2(35,3);
  v2(37,1)=11;
  v2(37,2)=6910;
  v2(37,3)=T224*y(57)*params(40)*(1+params(41))*params(49)*y(51)*T214*getPowerDeriv(y(50),(-params(42)),2);
  v2(38,1)=11;
  v2(38,2)=7040;
  v2(38,3)=T838*T219*y(57)*params(40)*(1+params(41))*params(49)*T214;
  v2(39,1)=11;
  v2(39,2)=5511;
  v2(39,3)=  v2(38,3);
  v2(40,1)=11;
  v2(40,2)=7050;
  v2(40,3)=T224*T881*y(57)*params(40)*(1+params(41))*params(49)*T214;
  v2(41,1)=11;
  v2(41,2)=6911;
  v2(41,3)=  v2(40,3);
  v2(42,1)=11;
  v2(42,2)=7460;
  v2(42,3)=T220*(T913*T1056+T837*T3/(y(54)*y(54)));
  v2(43,1)=11;
  v2(43,2)=5514;
  v2(43,3)=  v2(42,3);
  v2(44,1)=11;
  v2(44,2)=7470;
  v2(44,3)=T882*T914;
  v2(45,1)=11;
  v2(45,2)=6914;
  v2(45,3)=  v2(44,3);
  v2(46,1)=11;
  v2(46,2)=7471;
  v2(46,3)=T219*y(57)*params(40)*(1+params(41))*params(49)*T214*T914;
  v2(47,1)=11;
  v2(47,2)=7054;
  v2(47,3)=  v2(46,3);
  v2(48,1)=11;
  v2(48,2)=7474;
  v2(48,3)=T220*T1081;
  v2(49,1)=11;
  v2(49,2)=7880;
  v2(49,3)=T838*T219*T214*y(51)*params(49)*params(40)*(1+params(41));
  v2(50,1)=11;
  v2(50,2)=5517;
  v2(50,3)=  v2(49,3);
  v2(51,1)=11;
  v2(51,2)=7890;
  v2(51,3)=T224*T881*T214*y(51)*params(49)*params(40)*(1+params(41));
  v2(52,1)=11;
  v2(52,2)=6917;
  v2(52,3)=  v2(51,3);
  v2(53,1)=11;
  v2(53,2)=7891;
  v2(53,3)=T224*T219*T214*params(49)*params(40)*(1+params(41));
  v2(54,1)=11;
  v2(54,2)=7057;
  v2(54,3)=  v2(53,3);
  v2(55,1)=11;
  v2(55,2)=7894;
  v2(55,3)=T914*T219*T214*y(51)*params(49)*params(40)*(1+params(41));
  v2(56,1)=11;
  v2(56,2)=7477;
  v2(56,3)=  v2(55,3);
  v2(57,1)=11;
  v2(57,2)=8020;
  v2(57,3)=T838*T933;
  v2(58,1)=11;
  v2(58,2)=5518;
  v2(58,3)=  v2(57,3);
  v2(59,1)=11;
  v2(59,2)=8030;
  v2(59,3)=T224*T881*y(57)*params(40)*(1+params(41))*params(49)*y(51)*getPowerDeriv(y(58),T3,1);
  v2(60,1)=11;
  v2(60,2)=6918;
  v2(60,3)=  v2(59,3);
  v2(61,1)=11;
  v2(61,2)=8031;
  v2(61,3)=T224*T219*y(57)*params(40)*(1+params(41))*params(49)*getPowerDeriv(y(58),T3,1);
  v2(62,1)=11;
  v2(62,2)=7058;
  v2(62,3)=  v2(61,3);
  v2(63,1)=11;
  v2(63,2)=8034;
  v2(63,3)=T914*T933;
  v2(64,1)=11;
  v2(64,2)=7478;
  v2(64,3)=  v2(63,3);
  v2(65,1)=11;
  v2(65,2)=8037;
  v2(65,3)=T224*T219*y(51)*params(49)*params(40)*(1+params(41))*getPowerDeriv(y(58),T3,1);
  v2(66,1)=11;
  v2(66,2)=7898;
  v2(66,3)=  v2(65,3);
  v2(67,1)=11;
  v2(67,2)=8038;
  v2(67,3)=T224*T219*y(57)*params(40)*(1+params(41))*params(49)*y(51)*getPowerDeriv(y(58),T3,2);
  v2(68,1)=12;
  v2(68,2)=16075;
  v2(68,3)=y(117)*params(35)*params(44)*getPowerDeriv(y(115),params(43)-1,2);
  v2(69,1)=12;
  v2(69,2)=16355;
  v2(69,3)=params(35)*params(44)*getPowerDeriv(y(115),params(43)-1,1);
  v2(70,1)=12;
  v2(70,2)=16077;
  v2(70,3)=  v2(69,3);
  v2(71,1)=12;
  v2(71,2)=7180;
  v2(71,3)=(-y(57));
  v2(72,1)=12;
  v2(72,2)=5512;
  v2(72,3)=  v2(71,3);
  v2(73,1)=12;
  v2(73,2)=7880;
  v2(73,3)=1-y(52);
  v2(74,1)=12;
  v2(74,2)=5517;
  v2(74,3)=  v2(73,3);
  v2(75,1)=12;
  v2(75,2)=7892;
  v2(75,3)=(-y(40));
  v2(76,1)=12;
  v2(76,2)=7197;
  v2(76,3)=  v2(75,3);
  v2(77,1)=13;
  v2(77,2)=5181;
  v2(77,3)=params(37)*(y(3)*(1+y(11))+params(38)*y(13))*T3/(y(38)*y(38));
  v2(78,1)=13;
  v2(78,2)=38;
  v2(78,3)=  v2(77,3);
  v2(79,1)=13;
  v2(79,2)=5218;
  v2(79,3)=params(37)*(y(3)*(1+y(11))+params(38)*y(13))*(-((-(1+y(1)))*(y(38)+y(38))))/(y(38)*y(38)*y(38)*y(38));
  v2(80,1)=13;
  v2(80,2)=281;
  v2(80,3)=T747*params(37)*(1+y(11));
  v2(81,1)=13;
  v2(81,2)=3;
  v2(81,3)=  v2(80,3);
  v2(82,1)=13;
  v2(82,2)=318;
  v2(82,3)=T805*params(37)*(1+y(11));
  v2(83,1)=13;
  v2(83,2)=5183;
  v2(83,3)=  v2(82,3);
  v2(84,1)=13;
  v2(84,2)=1401;
  v2(84,3)=T747*params(37)*y(3);
  v2(85,1)=13;
  v2(85,2)=11;
  v2(85,3)=  v2(84,3);
  v2(86,1)=13;
  v2(86,2)=1438;
  v2(86,3)=T805*params(37)*y(3);
  v2(87,1)=13;
  v2(87,2)=5191;
  v2(87,3)=  v2(86,3);
  v2(88,1)=13;
  v2(88,2)=1403;
  v2(88,3)=params(37)*T268;
  v2(89,1)=13;
  v2(89,2)=291;
  v2(89,3)=  v2(88,3);
  v2(90,1)=13;
  v2(90,2)=7324;
  v2(90,3)=(-params(38));
  v2(91,1)=13;
  v2(91,2)=6073;
  v2(91,3)=  v2(90,3);
  v2(92,1)=13;
  v2(92,2)=1681;
  v2(92,3)=T747*params(37)*params(38);
  v2(93,1)=13;
  v2(93,2)=13;
  v2(93,3)=  v2(92,3);
  v2(94,1)=13;
  v2(94,2)=1718;
  v2(94,3)=T805*params(37)*params(38);
  v2(95,1)=13;
  v2(95,2)=5193;
  v2(95,3)=  v2(94,3);
  v2(96,1)=14;
  v2(96,2)=4936;
  v2(96,3)=params(38)*y(49)*getPowerDeriv(y(36),(-params(45)),2);
  v2(97,1)=14;
  v2(97,2)=5077;
  v2(97,3)=(1-params(38))*y(48)*getPowerDeriv(y(37),(-params(46)),2);
  v2(98,1)=14;
  v2(98,2)=6064;
  v2(98,3)=T298*getPowerDeriv(y(44),params(50),2);
  v2(99,1)=14;
  v2(99,2)=6617;
  v2(99,3)=(1-params(38))*T778;
  v2(100,1)=14;
  v2(100,2)=5088;
  v2(100,3)=  v2(99,3);
  v2(101,1)=14;
  v2(101,2)=6756;
  v2(101,3)=params(38)*T753;
  v2(102,1)=14;
  v2(102,2)=4949;
  v2(102,3)=  v2(101,3);
  v2(103,1)=14;
  v2(103,2)=9424;
  v2(103,3)=T294*getPowerDeriv(y(44),params(50),1);
  v2(104,1)=14;
  v2(104,2)=6088;
  v2(104,3)=  v2(103,3);
  v2(105,1)=15;
  v2(105,2)=5218;
  v2(105,3)=params(44)*y(2)*getPowerDeriv(y(38),(1+params(41))*params(43),2)+(1-params(44))*(T813*T1136+T812*T812*getPowerDeriv(T314,T315,2));
  v2(106,1)=15;
  v2(106,2)=178;
  v2(106,3)=params(44)*getPowerDeriv(y(38),(1+params(41))*params(43),1);
  v2(107,1)=15;
  v2(107,2)=5182;
  v2(107,3)=  v2(106,3);
  v2(108,1)=16;
  v2(108,2)=5218;
  v2(108,3)=T1136;
  v2(109,1)=16;
  v2(109,2)=5641;
  v2(109,3)=(-(T847*(-((-y(42))*(y(41)+y(41))))/(y(41)*y(41)*y(41)*y(41))+(-y(42))/(y(41)*y(41))*T1151));
  v2(110,1)=16;
  v2(110,2)=5781;
  v2(110,3)=(-(T851*T1151+T847*T3/(y(41)*y(41))));
  v2(111,1)=16;
  v2(111,2)=5642;
  v2(111,3)=  v2(110,3);
  v2(112,1)=16;
  v2(112,2)=5782;
  v2(112,3)=(-(T851*T851*T1150));
  v2(113,1)=17;
  v2(113,2)=6064;
  v2(113,3)=(1+params(51))*y(46)*getPowerDeriv(y(44),params(51),2)+params(50)*T298*getPowerDeriv(y(44),params(50)-1,2);
  v2(114,1)=17;
  v2(114,2)=6344;
  v2(114,3)=(1+params(51))*getPowerDeriv(y(44),params(51),1);
  v2(115,1)=17;
  v2(115,2)=6066;
  v2(115,3)=  v2(114,3);
  v2(116,1)=17;
  v2(116,2)=9424;
  v2(116,3)=getPowerDeriv(y(44),params(50)-1,1)*params(50)*T294;
  v2(117,1)=17;
  v2(117,2)=6088;
  v2(117,3)=  v2(116,3);
  v2(118,1)=18;
  v2(118,2)=4936;
  v2(118,3)=(-(y(49)*getPowerDeriv(y(36),(-params(45)),2)-y(43)*T224*T219*y(51)*T358*T1174));
  v2(119,1)=18;
  v2(119,2)=5077;
  v2(119,3)=(-((-(y(48)*getPowerDeriv(y(37),(-params(46)),2)))-y(43)*T224*T219*y(51)*T358*(-T1186)));
  v2(120,1)=18;
  v2(120,2)=5496;
  v2(120,3)=y(43)*T219*y(51)*T358*T758*T838;
  v2(121,1)=18;
  v2(121,2)=4940;
  v2(121,3)=  v2(120,3);
  v2(122,1)=18;
  v2(122,2)=5497;
  v2(122,3)=y(43)*T219*y(51)*T358*(-T784)*T838;
  v2(123,1)=18;
  v2(123,2)=5080;
  v2(123,3)=  v2(122,3);
  v2(124,1)=18;
  v2(124,2)=5500;
  v2(124,3)=y(43)*T219*y(51)*(T349-T352)*T358*1/y(54)*T1056;
  v2(125,1)=18;
  v2(125,2)=5916;
  v2(125,3)=T224*T219*y(51)*T358*T758;
  v2(126,1)=18;
  v2(126,2)=4943;
  v2(126,3)=  v2(125,3);
  v2(127,1)=18;
  v2(127,2)=5917;
  v2(127,3)=T224*T219*y(51)*T358*(-T784);
  v2(128,1)=18;
  v2(128,2)=5083;
  v2(128,3)=  v2(127,3);
  v2(129,1)=18;
  v2(129,2)=5920;
  v2(129,3)=T219*y(51)*(T349-T352)*T358*T838;
  v2(130,1)=18;
  v2(130,2)=5503;
  v2(130,3)=  v2(129,3);
  v2(131,1)=18;
  v2(131,2)=6617;
  v2(131,3)=T778;
  v2(132,1)=18;
  v2(132,2)=5088;
  v2(132,3)=  v2(131,3);
  v2(133,1)=18;
  v2(133,2)=6756;
  v2(133,3)=(-T753);
  v2(134,1)=18;
  v2(134,2)=4949;
  v2(134,3)=  v2(133,3);
  v2(135,1)=18;
  v2(135,2)=6896;
  v2(135,3)=y(43)*T224*y(51)*T358*T758*T881;
  v2(136,1)=18;
  v2(136,2)=4950;
  v2(136,3)=  v2(135,3);
  v2(137,1)=18;
  v2(137,2)=6897;
  v2(137,3)=y(43)*T224*y(51)*T358*(-T784)*T881;
  v2(138,1)=18;
  v2(138,2)=5090;
  v2(138,3)=  v2(137,3);
  v2(139,1)=18;
  v2(139,2)=6900;
  v2(139,3)=y(43)*T838*y(51)*(T349-T352)*T358*T881;
  v2(140,1)=18;
  v2(140,2)=5510;
  v2(140,3)=  v2(139,3);
  v2(141,1)=18;
  v2(141,2)=6903;
  v2(141,3)=T224*y(51)*(T349-T352)*T358*T881;
  v2(142,1)=18;
  v2(142,2)=5930;
  v2(142,3)=  v2(141,3);
  v2(143,1)=18;
  v2(143,2)=6910;
  v2(143,3)=y(43)*T224*y(51)*(T349-T352)*T358*getPowerDeriv(y(50),(-params(42)),2);
  v2(144,1)=18;
  v2(144,2)=7036;
  v2(144,3)=y(43)*T224*T219*T358*T758;
  v2(145,1)=18;
  v2(145,2)=4951;
  v2(145,3)=  v2(144,3);
  v2(146,1)=18;
  v2(146,2)=7037;
  v2(146,3)=y(43)*T224*T219*T358*(-T784);
  v2(147,1)=18;
  v2(147,2)=5091;
  v2(147,3)=  v2(146,3);
  v2(148,1)=18;
  v2(148,2)=7040;
  v2(148,3)=y(43)*T838*T219*(T349-T352)*T358;
  v2(149,1)=18;
  v2(149,2)=5511;
  v2(149,3)=  v2(148,3);
  v2(150,1)=18;
  v2(150,2)=7043;
  v2(150,3)=T224*T219*(T349-T352)*T358;
  v2(151,1)=18;
  v2(151,2)=5931;
  v2(151,3)=  v2(150,3);
  v2(152,1)=18;
  v2(152,2)=7050;
  v2(152,3)=y(43)*T224*(T349-T352)*T358*T881;
  v2(153,1)=18;
  v2(153,2)=6911;
  v2(153,3)=  v2(152,3);
  v2(154,1)=18;
  v2(154,2)=7456;
  v2(154,3)=y(43)*T219*y(51)*T358*T758*T914;
  v2(155,1)=18;
  v2(155,2)=4954;
  v2(155,3)=  v2(154,3);
  v2(156,1)=18;
  v2(156,2)=7457;
  v2(156,3)=y(43)*T219*y(51)*T358*(-T784)*T914;
  v2(157,1)=18;
  v2(157,2)=5094;
  v2(157,3)=  v2(156,3);
  v2(158,1)=18;
  v2(158,2)=7460;
  v2(158,3)=y(43)*T219*y(51)*(T349-T352)*T358*(T913*T1056+T837*T3/(y(54)*y(54)));
  v2(159,1)=18;
  v2(159,2)=5514;
  v2(159,3)=  v2(158,3);
  v2(160,1)=18;
  v2(160,2)=7463;
  v2(160,3)=T219*y(51)*(T349-T352)*T358*T914;
  v2(161,1)=18;
  v2(161,2)=5934;
  v2(161,3)=  v2(160,3);
  v2(162,1)=18;
  v2(162,2)=7470;
  v2(162,3)=y(43)*y(51)*(T349-T352)*T358*T881*T914;
  v2(163,1)=18;
  v2(163,2)=6914;
  v2(163,3)=  v2(162,3);
  v2(164,1)=18;
  v2(164,2)=7471;
  v2(164,3)=y(43)*T219*(T349-T352)*T358*T914;
  v2(165,1)=18;
  v2(165,2)=7054;
  v2(165,3)=  v2(164,3);
  v2(166,1)=18;
  v2(166,2)=7474;
  v2(166,3)=y(43)*T219*y(51)*(T349-T352)*T358*T1081;
  v2(167,1)=18;
  v2(167,2)=8016;
  v2(167,3)=y(43)*T224*T219*y(51)*T758*T937;
  v2(168,1)=18;
  v2(168,2)=4958;
  v2(168,3)=  v2(167,3);
  v2(169,1)=18;
  v2(169,2)=8017;
  v2(169,3)=y(43)*T224*T219*y(51)*(-T784)*T937;
  v2(170,1)=18;
  v2(170,2)=5098;
  v2(170,3)=  v2(169,3);
  v2(171,1)=18;
  v2(171,2)=8020;
  v2(171,3)=y(43)*T838*T219*y(51)*(T349-T352)*T937;
  v2(172,1)=18;
  v2(172,2)=5518;
  v2(172,3)=  v2(171,3);
  v2(173,1)=18;
  v2(173,2)=8023;
  v2(173,3)=T224*T219*y(51)*(T349-T352)*T937;
  v2(174,1)=18;
  v2(174,2)=5938;
  v2(174,3)=  v2(173,3);
  v2(175,1)=18;
  v2(175,2)=8030;
  v2(175,3)=y(43)*T224*T881*y(51)*(T349-T352)*T937;
  v2(176,1)=18;
  v2(176,2)=6918;
  v2(176,3)=  v2(175,3);
  v2(177,1)=18;
  v2(177,2)=8031;
  v2(177,3)=y(43)*T224*T219*(T349-T352)*T937;
  v2(178,1)=18;
  v2(178,2)=7058;
  v2(178,3)=  v2(177,3);
  v2(179,1)=18;
  v2(179,2)=8034;
  v2(179,3)=y(43)*T914*T219*y(51)*(T349-T352)*T937;
  v2(180,1)=18;
  v2(180,2)=7478;
  v2(180,3)=  v2(179,3);
  v2(181,1)=18;
  v2(181,2)=8038;
  v2(181,3)=y(43)*T224*T219*y(51)*(T349-T352)*1/params(49)*1/params(49)*getPowerDeriv(y(58)/params(49),(-(1+params(42)))/params(42),2);
  v2(182,1)=19;
  v2(182,2)=4936;
  v2(182,3)=(-(params(49)*(T767*params(38)*T1174+params(38)*T758*params(38)*T758*getPowerDeriv(params(38)*T349+(1-params(38))*T352,params(42),2))));
  v2(183,1)=19;
  v2(183,2)=5076;
  v2(183,3)=(-(params(49)*(1-params(38))*T784*params(38)*T758*getPowerDeriv(params(38)*T349+(1-params(38))*T352,params(42),2)));
  v2(184,1)=19;
  v2(184,2)=4937;
  v2(184,3)=  v2(183,3);
  v2(185,1)=19;
  v2(185,2)=5077;
  v2(185,3)=(-(params(49)*((1-params(38))*T784*(1-params(38))*T784*getPowerDeriv(params(38)*T349+(1-params(38))*T352,params(42),2)+T767*(1-params(38))*T1186)));
  v2(186,1)=31;
  v2(186,2)=8179;
  v2(186,3)=(-exp(y(59)));
  v2(187,1)=32;
  v2(187,2)=8320;
  v2(187,3)=(-exp(y(60)));
  v2(188,1)=33;
  v2(188,2)=8461;
  v2(188,3)=(-exp(y(61)));
  v2(189,1)=34;
  v2(189,2)=11281;
  v2(189,3)=(-exp(y(81)));
  v2(190,1)=35;
  v2(190,2)=11140;
  v2(190,3)=(-exp(y(80)));
  v2(191,1)=36;
  v2(191,2)=8602;
  v2(191,3)=(-exp(y(62)));
  v2(192,1)=37;
  v2(192,2)=8743;
  v2(192,3)=(-exp(y(63)));
  v2(193,1)=38;
  v2(193,2)=8884;
  v2(193,3)=(-exp(y(64)));
  v2(194,1)=39;
  v2(194,2)=9025;
  v2(194,3)=(-exp(y(65)));
  v2(195,1)=40;
  v2(195,2)=9166;
  v2(195,3)=(-exp(y(66)));
  v2(196,1)=41;
  v2(196,2)=9307;
  v2(196,3)=(-exp(y(67)));
  v2(197,1)=44;
  v2(197,2)=9871;
  v2(197,3)=(-exp(y(71)));
  v2(198,1)=45;
  v2(198,2)=10012;
  v2(198,3)=(-exp(y(72)));
  v2(199,1)=46;
  v2(199,2)=10153;
  v2(199,3)=(-exp(y(73)));
  v2(200,1)=47;
  v2(200,2)=10294;
  v2(200,3)=(-exp(y(74)));
  v2(201,1)=48;
  v2(201,2)=7192;
  v2(201,3)=T3/(1-params(81))*T3/(1-params(81))*getPowerDeriv((1-y(52))/(1-params(81)),T3,2);
  v2(202,1)=48;
  v2(202,2)=10435;
  v2(202,3)=(-exp(y(75)));
  v2(203,1)=49;
  v2(203,2)=10576;
  v2(203,3)=(-exp(y(76)));
  v2(204,1)=50;
  v2(204,2)=10717;
  v2(204,3)=(-exp(y(77)));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),79,19600);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],79,2744000);
end
end
