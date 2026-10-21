module top (alarm_short,
    buzzer,
    clear_log,
    clk,
    led_done,
    rst_n,
    sensor_in,
    bad_cnt,
    good_cnt,
    led_progress,
    mode_sel);
 output alarm_short;
 output buzzer;
 input clear_log;
 input clk;
 output led_done;
 input rst_n;
 input sensor_in;
 output [7:0] bad_cnt;
 output [7:0] good_cnt;
 output [2:0] led_progress;
 input [1:0] mode_sel;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _092_;
 wire _093_;
 wire _094_;
 wire _095_;
 wire _096_;
 wire _097_;
 wire _098_;
 wire _099_;
 wire _100_;
 wire _101_;
 wire _102_;
 wire _103_;
 wire _104_;
 wire _105_;
 wire _106_;
 wire _107_;
 wire _108_;
 wire _109_;
 wire _110_;
 wire _111_;
 wire _112_;
 wire _113_;
 wire _114_;
 wire _115_;
 wire _116_;
 wire _117_;
 wire _118_;
 wire _119_;
 wire _120_;
 wire _121_;
 wire _122_;
 wire _123_;
 wire _124_;
 wire _125_;
 wire _126_;
 wire _127_;
 wire _128_;
 wire _129_;
 wire _130_;
 wire _131_;
 wire _132_;
 wire _133_;
 wire _134_;
 wire _135_;
 wire _136_;
 wire _137_;
 wire _138_;
 wire _139_;
 wire _140_;
 wire _141_;
 wire _142_;
 wire _143_;
 wire _144_;
 wire _145_;
 wire _146_;
 wire _147_;
 wire _148_;
 wire _149_;
 wire _150_;
 wire _151_;
 wire _152_;
 wire _153_;
 wire _154_;
 wire _155_;
 wire _156_;
 wire _157_;
 wire _158_;
 wire _159_;
 wire _160_;
 wire _161_;
 wire _162_;
 wire _163_;
 wire _164_;
 wire _165_;
 wire _166_;
 wire _167_;
 wire _168_;
 wire _169_;
 wire _170_;
 wire _171_;
 wire _172_;
 wire _173_;
 wire _174_;
 wire _175_;
 wire _176_;
 wire _177_;
 wire _178_;
 wire _179_;
 wire _180_;
 wire _181_;
 wire _182_;
 wire _183_;
 wire _184_;
 wire _185_;
 wire _186_;
 wire _187_;
 wire _188_;
 wire _189_;
 wire _190_;
 wire _191_;
 wire _192_;
 wire _193_;
 wire _194_;
 wire _195_;
 wire _196_;
 wire _197_;
 wire _198_;
 wire _199_;
 wire _200_;
 wire _201_;
 wire _202_;
 wire bad_inc;
 wire good_inc;
 wire sensor_clean;
 wire sensor_sync;
 wire tick;
 wire \u_deb.cnt[0] ;
 wire \u_deb.cnt[10] ;
 wire \u_deb.cnt[1] ;
 wire \u_deb.cnt[2] ;
 wire \u_deb.cnt[3] ;
 wire \u_deb.cnt[4] ;
 wire \u_deb.cnt[5] ;
 wire \u_deb.cnt[6] ;
 wire \u_deb.cnt[7] ;
 wire \u_deb.cnt[8] ;
 wire \u_deb.cnt[9] ;
 wire \u_fsm.aux[0] ;
 wire \u_fsm.aux[1] ;
 wire \u_fsm.aux[2] ;
 wire \u_fsm.aux[3] ;
 wire \u_fsm.aux[4] ;
 wire \u_fsm.aux[5] ;
 wire \u_fsm.mode_r[0] ;
 wire \u_fsm.mode_r[1] ;
 wire \u_fsm.secs[0] ;
 wire \u_fsm.secs[1] ;
 wire \u_fsm.secs[2] ;
 wire \u_fsm.secs[3] ;
 wire \u_fsm.secs[4] ;
 wire \u_fsm.secs[5] ;
 wire \u_fsm.state[0] ;
 wire \u_fsm.state[1] ;
 wire \u_fsm.state[2] ;
 wire \u_sync.ff1 ;
 wire \u_tick.cnt[0] ;
 wire \u_tick.cnt[10] ;
 wire \u_tick.cnt[11] ;
 wire \u_tick.cnt[12] ;
 wire \u_tick.cnt[13] ;
 wire \u_tick.cnt[14] ;
 wire \u_tick.cnt[1] ;
 wire \u_tick.cnt[2] ;
 wire \u_tick.cnt[3] ;
 wire \u_tick.cnt[4] ;
 wire \u_tick.cnt[5] ;
 wire \u_tick.cnt[6] ;
 wire \u_tick.cnt[7] ;
 wire \u_tick.cnt[8] ;
 wire \u_tick.cnt[9] ;

 sky130_fd_sc_hd__inv_2 _203_ (.A(\u_fsm.state[0] ),
    .Y(_063_));
 sky130_fd_sc_hd__inv_2 _204_ (.A(tick),
    .Y(_064_));
 sky130_fd_sc_hd__inv_2 _205_ (.A(sensor_clean),
    .Y(_065_));
 sky130_fd_sc_hd__inv_2 _206_ (.A(\u_tick.cnt[2] ),
    .Y(_066_));
 sky130_fd_sc_hd__and3b_2 _207_ (.A_N(\u_fsm.state[2] ),
    .B(\u_fsm.state[0] ),
    .C(\u_fsm.state[1] ),
    .X(led_done));
 sky130_fd_sc_hd__nor2_2 _208_ (.A(\u_fsm.state[1] ),
    .B(\u_fsm.state[0] ),
    .Y(_067_));
 sky130_fd_sc_hd__or2_2 _209_ (.A(\u_fsm.state[1] ),
    .B(\u_fsm.state[0] ),
    .X(_068_));
 sky130_fd_sc_hd__and2_2 _210_ (.A(\u_fsm.state[2] ),
    .B(_067_),
    .X(alarm_short));
 sky130_fd_sc_hd__a21o_2 _211_ (.A1(\u_fsm.state[2] ),
    .A2(_067_),
    .B1(led_done),
    .X(buzzer));
 sky130_fd_sc_hd__xor2_2 _212_ (.A(sensor_clean),
    .B(sensor_sync),
    .X(_069_));
 sky130_fd_sc_hd__and2b_2 _213_ (.A_N(\u_deb.cnt[0] ),
    .B(_069_),
    .X(_000_));
 sky130_fd_sc_hd__o21ai_2 _214_ (.A1(\u_deb.cnt[1] ),
    .A2(\u_deb.cnt[0] ),
    .B1(_069_),
    .Y(_070_));
 sky130_fd_sc_hd__a21oi_2 _215_ (.A1(\u_deb.cnt[1] ),
    .A2(\u_deb.cnt[0] ),
    .B1(_070_),
    .Y(_002_));
 sky130_fd_sc_hd__and3_2 _216_ (.A(\u_deb.cnt[2] ),
    .B(\u_deb.cnt[1] ),
    .C(\u_deb.cnt[0] ),
    .X(_071_));
 sky130_fd_sc_hd__a21o_2 _217_ (.A1(\u_deb.cnt[1] ),
    .A2(\u_deb.cnt[0] ),
    .B1(\u_deb.cnt[2] ),
    .X(_072_));
 sky130_fd_sc_hd__and3b_2 _218_ (.A_N(_071_),
    .B(_072_),
    .C(_069_),
    .X(_003_));
 sky130_fd_sc_hd__and4_2 _219_ (.A(\u_deb.cnt[3] ),
    .B(\u_deb.cnt[2] ),
    .C(\u_deb.cnt[1] ),
    .D(\u_deb.cnt[0] ),
    .X(_073_));
 sky130_fd_sc_hd__or2_2 _220_ (.A(\u_deb.cnt[3] ),
    .B(_071_),
    .X(_074_));
 sky130_fd_sc_hd__and3b_2 _221_ (.A_N(_073_),
    .B(_074_),
    .C(_069_),
    .X(_004_));
 sky130_fd_sc_hd__o21ai_2 _222_ (.A1(\u_deb.cnt[4] ),
    .A2(_073_),
    .B1(_069_),
    .Y(_075_));
 sky130_fd_sc_hd__a21oi_2 _223_ (.A1(\u_deb.cnt[4] ),
    .A2(_073_),
    .B1(_075_),
    .Y(_005_));
 sky130_fd_sc_hd__and3_2 _224_ (.A(\u_deb.cnt[5] ),
    .B(\u_deb.cnt[4] ),
    .C(_073_),
    .X(_076_));
 sky130_fd_sc_hd__a21o_2 _225_ (.A1(\u_deb.cnt[4] ),
    .A2(_073_),
    .B1(\u_deb.cnt[5] ),
    .X(_077_));
 sky130_fd_sc_hd__and3b_2 _226_ (.A_N(_076_),
    .B(_077_),
    .C(_069_),
    .X(_006_));
 sky130_fd_sc_hd__and4_2 _227_ (.A(\u_deb.cnt[5] ),
    .B(\u_deb.cnt[4] ),
    .C(\u_deb.cnt[6] ),
    .D(_073_),
    .X(_078_));
 sky130_fd_sc_hd__o21ai_2 _228_ (.A1(\u_deb.cnt[6] ),
    .A2(_076_),
    .B1(_069_),
    .Y(_079_));
 sky130_fd_sc_hd__nor2_2 _229_ (.A(_078_),
    .B(_079_),
    .Y(_007_));
 sky130_fd_sc_hd__and2_2 _230_ (.A(\u_deb.cnt[7] ),
    .B(_078_),
    .X(_080_));
 sky130_fd_sc_hd__o21ai_2 _231_ (.A1(\u_deb.cnt[7] ),
    .A2(_078_),
    .B1(_069_),
    .Y(_081_));
 sky130_fd_sc_hd__nor2_2 _232_ (.A(_080_),
    .B(_081_),
    .Y(_008_));
 sky130_fd_sc_hd__and3_2 _233_ (.A(\u_deb.cnt[7] ),
    .B(\u_deb.cnt[8] ),
    .C(_078_),
    .X(_082_));
 sky130_fd_sc_hd__o21ai_2 _234_ (.A1(\u_deb.cnt[8] ),
    .A2(_080_),
    .B1(_069_),
    .Y(_083_));
 sky130_fd_sc_hd__nor2_2 _235_ (.A(_082_),
    .B(_083_),
    .Y(_009_));
 sky130_fd_sc_hd__and2_2 _236_ (.A(\u_deb.cnt[9] ),
    .B(_082_),
    .X(_084_));
 sky130_fd_sc_hd__o21ai_2 _237_ (.A1(\u_deb.cnt[9] ),
    .A2(_082_),
    .B1(_069_),
    .Y(_085_));
 sky130_fd_sc_hd__nor2_2 _238_ (.A(_084_),
    .B(_085_),
    .Y(_010_));
 sky130_fd_sc_hd__nand2_2 _239_ (.A(\u_deb.cnt[10] ),
    .B(_084_),
    .Y(_086_));
 sky130_fd_sc_hd__or2_2 _240_ (.A(\u_deb.cnt[10] ),
    .B(_084_),
    .X(_087_));
 sky130_fd_sc_hd__and3_2 _241_ (.A(_069_),
    .B(_086_),
    .C(_087_),
    .X(_001_));
 sky130_fd_sc_hd__nor2_2 _242_ (.A(\u_fsm.state[2] ),
    .B(_068_),
    .Y(_088_));
 sky130_fd_sc_hd__or2_2 _243_ (.A(\u_fsm.state[2] ),
    .B(_068_),
    .X(_089_));
 sky130_fd_sc_hd__nor2_2 _244_ (.A(\u_tick.cnt[0] ),
    .B(_088_),
    .Y(_013_));
 sky130_fd_sc_hd__nand2_2 _245_ (.A(\u_tick.cnt[1] ),
    .B(\u_tick.cnt[0] ),
    .Y(_090_));
 sky130_fd_sc_hd__or2_2 _246_ (.A(\u_tick.cnt[1] ),
    .B(\u_tick.cnt[0] ),
    .X(_091_));
 sky130_fd_sc_hd__and3_2 _247_ (.A(_089_),
    .B(_090_),
    .C(_091_),
    .X(_019_));
 sky130_fd_sc_hd__o21ai_2 _248_ (.A1(_066_),
    .A2(_090_),
    .B1(_089_),
    .Y(_092_));
 sky130_fd_sc_hd__a21oi_2 _249_ (.A1(_066_),
    .A2(_090_),
    .B1(_092_),
    .Y(_020_));
 sky130_fd_sc_hd__a31o_2 _250_ (.A1(\u_tick.cnt[1] ),
    .A2(\u_tick.cnt[0] ),
    .A3(\u_tick.cnt[2] ),
    .B1(\u_tick.cnt[3] ),
    .X(_093_));
 sky130_fd_sc_hd__and4_2 _251_ (.A(\u_tick.cnt[1] ),
    .B(\u_tick.cnt[0] ),
    .C(\u_tick.cnt[3] ),
    .D(\u_tick.cnt[2] ),
    .X(_094_));
 sky130_fd_sc_hd__inv_2 _252_ (.A(_094_),
    .Y(_095_));
 sky130_fd_sc_hd__and3_2 _253_ (.A(_089_),
    .B(_093_),
    .C(_095_),
    .X(_021_));
 sky130_fd_sc_hd__a21oi_2 _254_ (.A1(\u_tick.cnt[4] ),
    .A2(_094_),
    .B1(_088_),
    .Y(_096_));
 sky130_fd_sc_hd__o21a_2 _255_ (.A1(\u_tick.cnt[4] ),
    .A2(_094_),
    .B1(_096_),
    .X(_022_));
 sky130_fd_sc_hd__a21oi_2 _256_ (.A1(\u_tick.cnt[4] ),
    .A2(_094_),
    .B1(\u_tick.cnt[5] ),
    .Y(_097_));
 sky130_fd_sc_hd__and3_2 _257_ (.A(\u_tick.cnt[5] ),
    .B(\u_tick.cnt[4] ),
    .C(_094_),
    .X(_098_));
 sky130_fd_sc_hd__nor3_2 _258_ (.A(_088_),
    .B(_097_),
    .C(_098_),
    .Y(_023_));
 sky130_fd_sc_hd__and4_2 _259_ (.A(\u_tick.cnt[5] ),
    .B(\u_tick.cnt[4] ),
    .C(\u_tick.cnt[6] ),
    .D(_094_),
    .X(_099_));
 sky130_fd_sc_hd__o21ai_2 _260_ (.A1(\u_tick.cnt[6] ),
    .A2(_098_),
    .B1(_089_),
    .Y(_100_));
 sky130_fd_sc_hd__nor2_2 _261_ (.A(_099_),
    .B(_100_),
    .Y(_024_));
 sky130_fd_sc_hd__and2_2 _262_ (.A(\u_tick.cnt[7] ),
    .B(_099_),
    .X(_101_));
 sky130_fd_sc_hd__o21ai_2 _263_ (.A1(\u_tick.cnt[7] ),
    .A2(_099_),
    .B1(_089_),
    .Y(_102_));
 sky130_fd_sc_hd__nor2_2 _264_ (.A(_101_),
    .B(_102_),
    .Y(_025_));
 sky130_fd_sc_hd__a21oi_2 _265_ (.A1(\u_tick.cnt[8] ),
    .A2(_101_),
    .B1(_088_),
    .Y(_103_));
 sky130_fd_sc_hd__o21a_2 _266_ (.A1(\u_tick.cnt[8] ),
    .A2(_101_),
    .B1(_103_),
    .X(_026_));
 sky130_fd_sc_hd__a31o_2 _267_ (.A1(\u_tick.cnt[7] ),
    .A2(\u_tick.cnt[8] ),
    .A3(_099_),
    .B1(\u_tick.cnt[9] ),
    .X(_104_));
 sky130_fd_sc_hd__and4_2 _268_ (.A(\u_tick.cnt[7] ),
    .B(\u_tick.cnt[9] ),
    .C(\u_tick.cnt[8] ),
    .D(_099_),
    .X(_105_));
 sky130_fd_sc_hd__nor2_2 _269_ (.A(_088_),
    .B(_105_),
    .Y(_106_));
 sky130_fd_sc_hd__and2_2 _270_ (.A(_104_),
    .B(_106_),
    .X(_027_));
 sky130_fd_sc_hd__a21oi_2 _271_ (.A1(\u_tick.cnt[10] ),
    .A2(_105_),
    .B1(_088_),
    .Y(_107_));
 sky130_fd_sc_hd__o21a_2 _272_ (.A1(\u_tick.cnt[10] ),
    .A2(_105_),
    .B1(_107_),
    .X(_014_));
 sky130_fd_sc_hd__a21oi_2 _273_ (.A1(\u_tick.cnt[10] ),
    .A2(_105_),
    .B1(\u_tick.cnt[11] ),
    .Y(_108_));
 sky130_fd_sc_hd__and3_2 _274_ (.A(\u_tick.cnt[11] ),
    .B(\u_tick.cnt[10] ),
    .C(_105_),
    .X(_109_));
 sky130_fd_sc_hd__nor3_2 _275_ (.A(_088_),
    .B(_108_),
    .C(_109_),
    .Y(_015_));
 sky130_fd_sc_hd__o21ai_2 _276_ (.A1(\u_tick.cnt[12] ),
    .A2(_109_),
    .B1(_089_),
    .Y(_110_));
 sky130_fd_sc_hd__a21oi_2 _277_ (.A1(\u_tick.cnt[12] ),
    .A2(_109_),
    .B1(_110_),
    .Y(_016_));
 sky130_fd_sc_hd__a21oi_2 _278_ (.A1(\u_tick.cnt[12] ),
    .A2(_109_),
    .B1(\u_tick.cnt[13] ),
    .Y(_111_));
 sky130_fd_sc_hd__a31o_2 _279_ (.A1(\u_tick.cnt[13] ),
    .A2(\u_tick.cnt[12] ),
    .A3(_109_),
    .B1(_088_),
    .X(_112_));
 sky130_fd_sc_hd__nor2_2 _280_ (.A(_111_),
    .B(_112_),
    .Y(_017_));
 sky130_fd_sc_hd__a31o_2 _281_ (.A1(\u_tick.cnt[13] ),
    .A2(\u_tick.cnt[12] ),
    .A3(_109_),
    .B1(\u_tick.cnt[14] ),
    .X(_113_));
 sky130_fd_sc_hd__nand4_2 _282_ (.A(\u_tick.cnt[13] ),
    .B(\u_tick.cnt[12] ),
    .C(\u_tick.cnt[14] ),
    .D(_109_),
    .Y(_114_));
 sky130_fd_sc_hd__and3_2 _283_ (.A(_089_),
    .B(_113_),
    .C(_114_),
    .X(_018_));
 sky130_fd_sc_hd__nor2_2 _284_ (.A(_088_),
    .B(_114_),
    .Y(_028_));
 sky130_fd_sc_hd__and3b_2 _285_ (.A_N(\u_fsm.state[1] ),
    .B(\u_fsm.state[0] ),
    .C(\u_fsm.state[2] ),
    .X(_115_));
 sky130_fd_sc_hd__nor2_2 _286_ (.A(_088_),
    .B(_115_),
    .Y(_116_));
 sky130_fd_sc_hd__or2_2 _287_ (.A(_088_),
    .B(_115_),
    .X(_117_));
 sky130_fd_sc_hd__and2b_2 _288_ (.A_N(\u_fsm.mode_r[0] ),
    .B(\u_fsm.mode_r[1] ),
    .X(_118_));
 sky130_fd_sc_hd__nand2b_2 _289_ (.A_N(\u_fsm.mode_r[0] ),
    .B(\u_fsm.mode_r[1] ),
    .Y(_119_));
 sky130_fd_sc_hd__and2b_2 _290_ (.A_N(\u_fsm.mode_r[1] ),
    .B(\u_fsm.mode_r[0] ),
    .X(_120_));
 sky130_fd_sc_hd__a221o_2 _291_ (.A1(\u_fsm.secs[0] ),
    .A2(_118_),
    .B1(_120_),
    .B2(\u_fsm.secs[2] ),
    .C1(\u_fsm.secs[1] ),
    .X(_121_));
 sky130_fd_sc_hd__xnor2_2 _292_ (.A(\u_fsm.mode_r[1] ),
    .B(\u_fsm.mode_r[0] ),
    .Y(_122_));
 sky130_fd_sc_hd__o221a_2 _293_ (.A1(\u_fsm.secs[2] ),
    .A2(_120_),
    .B1(_122_),
    .B2(\u_fsm.secs[3] ),
    .C1(_121_),
    .X(_123_));
 sky130_fd_sc_hd__a21o_2 _294_ (.A1(\u_fsm.secs[3] ),
    .A2(_122_),
    .B1(\u_fsm.secs[4] ),
    .X(_124_));
 sky130_fd_sc_hd__o31a_2 _295_ (.A1(\u_fsm.secs[5] ),
    .A2(_123_),
    .A3(_124_),
    .B1(_116_),
    .X(led_progress[0]));
 sky130_fd_sc_hd__or2_2 _296_ (.A(\u_fsm.secs[3] ),
    .B(\u_fsm.secs[2] ),
    .X(_125_));
 sky130_fd_sc_hd__a221o_2 _297_ (.A1(\u_fsm.secs[1] ),
    .A2(_118_),
    .B1(_120_),
    .B2(\u_fsm.secs[3] ),
    .C1(\u_fsm.secs[2] ),
    .X(_126_));
 sky130_fd_sc_hd__nor2_2 _298_ (.A(\u_fsm.secs[1] ),
    .B(\u_fsm.secs[0] ),
    .Y(_127_));
 sky130_fd_sc_hd__and2b_2 _299_ (.A_N(_127_),
    .B(_122_),
    .X(_128_));
 sky130_fd_sc_hd__o221a_2 _300_ (.A1(\u_fsm.secs[3] ),
    .A2(_120_),
    .B1(_128_),
    .B2(\u_fsm.secs[4] ),
    .C1(_126_),
    .X(_129_));
 sky130_fd_sc_hd__a21o_2 _301_ (.A1(\u_fsm.secs[4] ),
    .A2(_122_),
    .B1(\u_fsm.secs[5] ),
    .X(_130_));
 sky130_fd_sc_hd__o21a_2 _302_ (.A1(_129_),
    .A2(_130_),
    .B1(_116_),
    .X(led_progress[1]));
 sky130_fd_sc_hd__and2_2 _303_ (.A(\u_fsm.secs[3] ),
    .B(\u_fsm.secs[2] ),
    .X(_131_));
 sky130_fd_sc_hd__a32o_2 _304_ (.A1(\u_fsm.secs[1] ),
    .A2(_119_),
    .A3(_131_),
    .B1(_125_),
    .B2(_122_),
    .X(_132_));
 sky130_fd_sc_hd__o31a_2 _305_ (.A1(\u_fsm.secs[3] ),
    .A2(\u_fsm.secs[4] ),
    .A3(_119_),
    .B1(\u_fsm.secs[5] ),
    .X(_133_));
 sky130_fd_sc_hd__a21oi_2 _306_ (.A1(\u_fsm.secs[4] ),
    .A2(_132_),
    .B1(_133_),
    .Y(_134_));
 sky130_fd_sc_hd__nor2_2 _307_ (.A(_117_),
    .B(_134_),
    .Y(led_progress[2]));
 sky130_fd_sc_hd__nor3_2 _308_ (.A(\u_fsm.state[1] ),
    .B(_063_),
    .C(\u_fsm.state[2] ),
    .Y(_135_));
 sky130_fd_sc_hd__and3b_2 _309_ (.A_N(_134_),
    .B(_135_),
    .C(sensor_clean),
    .X(_012_));
 sky130_fd_sc_hd__and4_2 _310_ (.A(\u_fsm.aux[1] ),
    .B(\u_fsm.aux[0] ),
    .C(\u_fsm.aux[4] ),
    .D(\u_fsm.aux[5] ),
    .X(_136_));
 sky130_fd_sc_hd__and3_2 _311_ (.A(\u_fsm.aux[3] ),
    .B(\u_fsm.aux[2] ),
    .C(_136_),
    .X(_137_));
 sky130_fd_sc_hd__or4_2 _312_ (.A(\u_fsm.aux[1] ),
    .B(\u_fsm.aux[0] ),
    .C(\u_fsm.aux[4] ),
    .D(\u_fsm.aux[5] ),
    .X(_138_));
 sky130_fd_sc_hd__nor3_2 _313_ (.A(\u_fsm.aux[3] ),
    .B(\u_fsm.aux[2] ),
    .C(_138_),
    .Y(_139_));
 sky130_fd_sc_hd__or3b_2 _314_ (.A(\u_fsm.state[0] ),
    .B(\u_fsm.state[2] ),
    .C_N(\u_fsm.state[1] ),
    .X(_140_));
 sky130_fd_sc_hd__nor2_2 _315_ (.A(sensor_clean),
    .B(_140_),
    .Y(_141_));
 sky130_fd_sc_hd__and4bb_2 _316_ (.A_N(_137_),
    .B_N(_139_),
    .C(_141_),
    .D(tick),
    .X(_011_));
 sky130_fd_sc_hd__and3_2 _317_ (.A(sensor_clean),
    .B(_134_),
    .C(_135_),
    .X(_142_));
 sky130_fd_sc_hd__nor2_2 _318_ (.A(_065_),
    .B(_140_),
    .Y(_143_));
 sky130_fd_sc_hd__a221o_2 _319_ (.A1(\u_fsm.state[2] ),
    .A2(_068_),
    .B1(_141_),
    .B2(_064_),
    .C1(_143_),
    .X(_144_));
 sky130_fd_sc_hd__o21ai_2 _320_ (.A1(_137_),
    .A2(_139_),
    .B1(tick),
    .Y(_145_));
 sky130_fd_sc_hd__a211o_2 _321_ (.A1(buzzer),
    .A2(_145_),
    .B1(_144_),
    .C1(_142_),
    .X(_146_));
 sky130_fd_sc_hd__nor2_2 _322_ (.A(buzzer),
    .B(_141_),
    .Y(_147_));
 sky130_fd_sc_hd__inv_2 _323_ (.A(_147_),
    .Y(_148_));
 sky130_fd_sc_hd__o2bb2a_2 _324_ (.A1_N(sensor_clean),
    .A2_N(_115_),
    .B1(_145_),
    .B2(_147_),
    .X(_149_));
 sky130_fd_sc_hd__nor2_2 _325_ (.A(\u_fsm.aux[0] ),
    .B(_149_),
    .Y(_150_));
 sky130_fd_sc_hd__mux2_1 _326_ (.A0(_150_),
    .A1(\u_fsm.aux[0] ),
    .S(_146_),
    .X(_029_));
 sky130_fd_sc_hd__and2_2 _327_ (.A(\u_fsm.aux[1] ),
    .B(_146_),
    .X(_030_));
 sky130_fd_sc_hd__and2_2 _328_ (.A(\u_fsm.aux[2] ),
    .B(_146_),
    .X(_031_));
 sky130_fd_sc_hd__and2_2 _329_ (.A(\u_fsm.aux[3] ),
    .B(_146_),
    .X(_032_));
 sky130_fd_sc_hd__and2_2 _330_ (.A(\u_fsm.aux[4] ),
    .B(_146_),
    .X(_033_));
 sky130_fd_sc_hd__and2_2 _331_ (.A(\u_fsm.aux[5] ),
    .B(_146_),
    .X(_034_));
 sky130_fd_sc_hd__nand2_2 _332_ (.A(bad_cnt[0]),
    .B(bad_cnt[1]),
    .Y(_151_));
 sky130_fd_sc_hd__nand3_2 _333_ (.A(bad_cnt[0]),
    .B(bad_cnt[1]),
    .C(bad_cnt[2]),
    .Y(_152_));
 sky130_fd_sc_hd__and4_2 _334_ (.A(bad_cnt[0]),
    .B(bad_cnt[1]),
    .C(bad_cnt[2]),
    .D(bad_cnt[3]),
    .X(_153_));
 sky130_fd_sc_hd__inv_2 _335_ (.A(_153_),
    .Y(_154_));
 sky130_fd_sc_hd__nand2_2 _336_ (.A(bad_cnt[4]),
    .B(_153_),
    .Y(_155_));
 sky130_fd_sc_hd__and3_2 _337_ (.A(bad_cnt[4]),
    .B(bad_cnt[5]),
    .C(_153_),
    .X(_156_));
 sky130_fd_sc_hd__inv_2 _338_ (.A(_156_),
    .Y(_157_));
 sky130_fd_sc_hd__and2_2 _339_ (.A(bad_cnt[6]),
    .B(_156_),
    .X(_158_));
 sky130_fd_sc_hd__inv_2 _340_ (.A(_158_),
    .Y(_159_));
 sky130_fd_sc_hd__nand2_2 _341_ (.A(bad_cnt[7]),
    .B(_158_),
    .Y(_160_));
 sky130_fd_sc_hd__a21oi_2 _342_ (.A1(bad_inc),
    .A2(_160_),
    .B1(clear_log),
    .Y(_161_));
 sky130_fd_sc_hd__and3b_2 _343_ (.A_N(clear_log),
    .B(bad_inc),
    .C(_160_),
    .X(_162_));
 sky130_fd_sc_hd__mux2_1 _344_ (.A0(_162_),
    .A1(_161_),
    .S(bad_cnt[0]),
    .X(_035_));
 sky130_fd_sc_hd__or2_2 _345_ (.A(bad_cnt[0]),
    .B(bad_cnt[1]),
    .X(_163_));
 sky130_fd_sc_hd__a32o_2 _346_ (.A1(_151_),
    .A2(_162_),
    .A3(_163_),
    .B1(_161_),
    .B2(bad_cnt[1]),
    .X(_036_));
 sky130_fd_sc_hd__a21o_2 _347_ (.A1(bad_cnt[0]),
    .A2(bad_cnt[1]),
    .B1(bad_cnt[2]),
    .X(_164_));
 sky130_fd_sc_hd__a32o_2 _348_ (.A1(_152_),
    .A2(_162_),
    .A3(_164_),
    .B1(_161_),
    .B2(bad_cnt[2]),
    .X(_037_));
 sky130_fd_sc_hd__a31o_2 _349_ (.A1(bad_cnt[0]),
    .A2(bad_cnt[1]),
    .A3(bad_cnt[2]),
    .B1(bad_cnt[3]),
    .X(_165_));
 sky130_fd_sc_hd__a32o_2 _350_ (.A1(_154_),
    .A2(_162_),
    .A3(_165_),
    .B1(_161_),
    .B2(bad_cnt[3]),
    .X(_038_));
 sky130_fd_sc_hd__or2_2 _351_ (.A(bad_cnt[4]),
    .B(_153_),
    .X(_166_));
 sky130_fd_sc_hd__a32o_2 _352_ (.A1(_155_),
    .A2(_162_),
    .A3(_166_),
    .B1(_161_),
    .B2(bad_cnt[4]),
    .X(_039_));
 sky130_fd_sc_hd__a21o_2 _353_ (.A1(bad_cnt[4]),
    .A2(_153_),
    .B1(bad_cnt[5]),
    .X(_167_));
 sky130_fd_sc_hd__a32o_2 _354_ (.A1(_157_),
    .A2(_162_),
    .A3(_167_),
    .B1(_161_),
    .B2(bad_cnt[5]),
    .X(_040_));
 sky130_fd_sc_hd__or2_2 _355_ (.A(bad_cnt[6]),
    .B(_156_),
    .X(_168_));
 sky130_fd_sc_hd__a32o_2 _356_ (.A1(_159_),
    .A2(_162_),
    .A3(_168_),
    .B1(_161_),
    .B2(bad_cnt[6]),
    .X(_041_));
 sky130_fd_sc_hd__a21oi_2 _357_ (.A1(bad_inc),
    .A2(_158_),
    .B1(bad_cnt[7]),
    .Y(_169_));
 sky130_fd_sc_hd__nor2_2 _358_ (.A(clear_log),
    .B(_169_),
    .Y(_042_));
 sky130_fd_sc_hd__nand2_2 _359_ (.A(good_cnt[1]),
    .B(good_cnt[0]),
    .Y(_170_));
 sky130_fd_sc_hd__nand3_2 _360_ (.A(good_cnt[1]),
    .B(good_cnt[0]),
    .C(good_cnt[2]),
    .Y(_171_));
 sky130_fd_sc_hd__and4_2 _361_ (.A(good_cnt[1]),
    .B(good_cnt[0]),
    .C(good_cnt[2]),
    .D(good_cnt[3]),
    .X(_172_));
 sky130_fd_sc_hd__inv_2 _362_ (.A(_172_),
    .Y(_173_));
 sky130_fd_sc_hd__nand2_2 _363_ (.A(good_cnt[4]),
    .B(_172_),
    .Y(_174_));
 sky130_fd_sc_hd__and3_2 _364_ (.A(good_cnt[5]),
    .B(good_cnt[4]),
    .C(_172_),
    .X(_175_));
 sky130_fd_sc_hd__inv_2 _365_ (.A(_175_),
    .Y(_176_));
 sky130_fd_sc_hd__and2_2 _366_ (.A(good_cnt[6]),
    .B(_175_),
    .X(_177_));
 sky130_fd_sc_hd__inv_2 _367_ (.A(_177_),
    .Y(_178_));
 sky130_fd_sc_hd__nand2_2 _368_ (.A(good_cnt[7]),
    .B(_177_),
    .Y(_179_));
 sky130_fd_sc_hd__a21oi_2 _369_ (.A1(good_inc),
    .A2(_179_),
    .B1(clear_log),
    .Y(_180_));
 sky130_fd_sc_hd__and3b_2 _370_ (.A_N(clear_log),
    .B(_179_),
    .C(good_inc),
    .X(_181_));
 sky130_fd_sc_hd__mux2_1 _371_ (.A0(_181_),
    .A1(_180_),
    .S(good_cnt[0]),
    .X(_043_));
 sky130_fd_sc_hd__or2_2 _372_ (.A(good_cnt[1]),
    .B(good_cnt[0]),
    .X(_182_));
 sky130_fd_sc_hd__a32o_2 _373_ (.A1(_170_),
    .A2(_181_),
    .A3(_182_),
    .B1(_180_),
    .B2(good_cnt[1]),
    .X(_044_));
 sky130_fd_sc_hd__a21o_2 _374_ (.A1(good_cnt[1]),
    .A2(good_cnt[0]),
    .B1(good_cnt[2]),
    .X(_183_));
 sky130_fd_sc_hd__a32o_2 _375_ (.A1(_171_),
    .A2(_181_),
    .A3(_183_),
    .B1(_180_),
    .B2(good_cnt[2]),
    .X(_045_));
 sky130_fd_sc_hd__a31o_2 _376_ (.A1(good_cnt[1]),
    .A2(good_cnt[0]),
    .A3(good_cnt[2]),
    .B1(good_cnt[3]),
    .X(_184_));
 sky130_fd_sc_hd__a32o_2 _377_ (.A1(_173_),
    .A2(_181_),
    .A3(_184_),
    .B1(_180_),
    .B2(good_cnt[3]),
    .X(_046_));
 sky130_fd_sc_hd__or2_2 _378_ (.A(good_cnt[4]),
    .B(_172_),
    .X(_185_));
 sky130_fd_sc_hd__a32o_2 _379_ (.A1(_174_),
    .A2(_181_),
    .A3(_185_),
    .B1(_180_),
    .B2(good_cnt[4]),
    .X(_047_));
 sky130_fd_sc_hd__a21o_2 _380_ (.A1(good_cnt[4]),
    .A2(_172_),
    .B1(good_cnt[5]),
    .X(_186_));
 sky130_fd_sc_hd__a32o_2 _381_ (.A1(_176_),
    .A2(_181_),
    .A3(_186_),
    .B1(_180_),
    .B2(good_cnt[5]),
    .X(_048_));
 sky130_fd_sc_hd__or2_2 _382_ (.A(good_cnt[6]),
    .B(_175_),
    .X(_187_));
 sky130_fd_sc_hd__a32o_2 _383_ (.A1(_178_),
    .A2(_181_),
    .A3(_187_),
    .B1(_180_),
    .B2(good_cnt[6]),
    .X(_049_));
 sky130_fd_sc_hd__a21oi_2 _384_ (.A1(good_inc),
    .A2(_177_),
    .B1(good_cnt[7]),
    .Y(_188_));
 sky130_fd_sc_hd__nor2_2 _385_ (.A(clear_log),
    .B(_188_),
    .Y(_050_));
 sky130_fd_sc_hd__a2bb2o_2 _386_ (.A1_N(tick),
    .A2_N(_147_),
    .B1(_088_),
    .B2(_065_),
    .X(_189_));
 sky130_fd_sc_hd__or3b_2 _387_ (.A(_189_),
    .B(_142_),
    .C_N(_149_),
    .X(_190_));
 sky130_fd_sc_hd__a21o_2 _388_ (.A1(sensor_clean),
    .A2(_135_),
    .B1(_088_),
    .X(_191_));
 sky130_fd_sc_hd__or3_2 _389_ (.A(buzzer),
    .B(_143_),
    .C(_191_),
    .X(_192_));
 sky130_fd_sc_hd__mux2_1 _390_ (.A0(_192_),
    .A1(\u_fsm.state[0] ),
    .S(_190_),
    .X(_051_));
 sky130_fd_sc_hd__mux2_1 _391_ (.A0(_135_),
    .A1(\u_fsm.state[1] ),
    .S(_190_),
    .X(_052_));
 sky130_fd_sc_hd__mux2_1 _392_ (.A0(_148_),
    .A1(\u_fsm.state[2] ),
    .S(_190_),
    .X(_053_));
 sky130_fd_sc_hd__nand2_2 _393_ (.A(sensor_clean),
    .B(_088_),
    .Y(_193_));
 sky130_fd_sc_hd__mux2_1 _394_ (.A0(mode_sel[0]),
    .A1(\u_fsm.mode_r[0] ),
    .S(_193_),
    .X(_054_));
 sky130_fd_sc_hd__mux2_1 _395_ (.A0(mode_sel[1]),
    .A1(\u_fsm.mode_r[1] ),
    .S(_193_),
    .X(_055_));
 sky130_fd_sc_hd__mux2_1 _396_ (.A0(sensor_sync),
    .A1(sensor_clean),
    .S(_086_),
    .X(_056_));
 sky130_fd_sc_hd__o221a_2 _397_ (.A1(_063_),
    .A2(tick),
    .B1(_117_),
    .B2(_134_),
    .C1(_191_),
    .X(_194_));
 sky130_fd_sc_hd__nor2_2 _398_ (.A(_063_),
    .B(\u_fsm.secs[0] ),
    .Y(_195_));
 sky130_fd_sc_hd__mux2_1 _399_ (.A0(\u_fsm.secs[0] ),
    .A1(_195_),
    .S(_194_),
    .X(_057_));
 sky130_fd_sc_hd__and2_2 _400_ (.A(\u_fsm.secs[1] ),
    .B(\u_fsm.secs[0] ),
    .X(_196_));
 sky130_fd_sc_hd__nor3b_2 _401_ (.A(_127_),
    .B(_196_),
    .C_N(_135_),
    .Y(_197_));
 sky130_fd_sc_hd__mux2_1 _402_ (.A0(\u_fsm.secs[1] ),
    .A1(_197_),
    .S(_194_),
    .X(_058_));
 sky130_fd_sc_hd__a21oi_2 _403_ (.A1(_194_),
    .A2(_196_),
    .B1(\u_fsm.secs[2] ),
    .Y(_198_));
 sky130_fd_sc_hd__and3_2 _404_ (.A(\u_fsm.secs[2] ),
    .B(_194_),
    .C(_196_),
    .X(_199_));
 sky130_fd_sc_hd__nor3_2 _405_ (.A(_088_),
    .B(_198_),
    .C(_199_),
    .Y(_059_));
 sky130_fd_sc_hd__a31oi_2 _406_ (.A1(_131_),
    .A2(_194_),
    .A3(_196_),
    .B1(_088_),
    .Y(_200_));
 sky130_fd_sc_hd__o21a_2 _407_ (.A1(\u_fsm.secs[3] ),
    .A2(_199_),
    .B1(_200_),
    .X(_060_));
 sky130_fd_sc_hd__and2b_2 _408_ (.A_N(\u_fsm.secs[4] ),
    .B(_135_),
    .X(_201_));
 sky130_fd_sc_hd__a32o_2 _409_ (.A1(\u_fsm.secs[3] ),
    .A2(_199_),
    .A3(_201_),
    .B1(_200_),
    .B2(\u_fsm.secs[4] ),
    .X(_061_));
 sky130_fd_sc_hd__a41o_2 _410_ (.A1(\u_fsm.secs[4] ),
    .A2(_131_),
    .A3(_194_),
    .A4(_196_),
    .B1(\u_fsm.secs[5] ),
    .X(_202_));
 sky130_fd_sc_hd__and2_2 _411_ (.A(_089_),
    .B(_202_),
    .X(_062_));
 sky130_fd_sc_hd__dfrtp_2 _412_ (.CLK(clk),
    .D(_029_),
    .RESET_B(rst_n),
    .Q(\u_fsm.aux[0] ));
 sky130_fd_sc_hd__dfrtp_2 _413_ (.CLK(clk),
    .D(_030_),
    .RESET_B(rst_n),
    .Q(\u_fsm.aux[1] ));
 sky130_fd_sc_hd__dfrtp_2 _414_ (.CLK(clk),
    .D(_031_),
    .RESET_B(rst_n),
    .Q(\u_fsm.aux[2] ));
 sky130_fd_sc_hd__dfrtp_2 _415_ (.CLK(clk),
    .D(_032_),
    .RESET_B(rst_n),
    .Q(\u_fsm.aux[3] ));
 sky130_fd_sc_hd__dfrtp_2 _416_ (.CLK(clk),
    .D(_033_),
    .RESET_B(rst_n),
    .Q(\u_fsm.aux[4] ));
 sky130_fd_sc_hd__dfrtp_2 _417_ (.CLK(clk),
    .D(_034_),
    .RESET_B(rst_n),
    .Q(\u_fsm.aux[5] ));
 sky130_fd_sc_hd__dfrtp_2 _418_ (.CLK(clk),
    .D(sensor_in),
    .RESET_B(rst_n),
    .Q(\u_sync.ff1 ));
 sky130_fd_sc_hd__dfrtp_2 _419_ (.CLK(clk),
    .D(\u_sync.ff1 ),
    .RESET_B(rst_n),
    .Q(sensor_sync));
 sky130_fd_sc_hd__dfrtp_2 _420_ (.CLK(clk),
    .D(_035_),
    .RESET_B(rst_n),
    .Q(bad_cnt[0]));
 sky130_fd_sc_hd__dfrtp_2 _421_ (.CLK(clk),
    .D(_036_),
    .RESET_B(rst_n),
    .Q(bad_cnt[1]));
 sky130_fd_sc_hd__dfrtp_2 _422_ (.CLK(clk),
    .D(_037_),
    .RESET_B(rst_n),
    .Q(bad_cnt[2]));
 sky130_fd_sc_hd__dfrtp_2 _423_ (.CLK(clk),
    .D(_038_),
    .RESET_B(rst_n),
    .Q(bad_cnt[3]));
 sky130_fd_sc_hd__dfrtp_2 _424_ (.CLK(clk),
    .D(_039_),
    .RESET_B(rst_n),
    .Q(bad_cnt[4]));
 sky130_fd_sc_hd__dfrtp_2 _425_ (.CLK(clk),
    .D(_040_),
    .RESET_B(rst_n),
    .Q(bad_cnt[5]));
 sky130_fd_sc_hd__dfrtp_2 _426_ (.CLK(clk),
    .D(_041_),
    .RESET_B(rst_n),
    .Q(bad_cnt[6]));
 sky130_fd_sc_hd__dfrtp_2 _427_ (.CLK(clk),
    .D(_042_),
    .RESET_B(rst_n),
    .Q(bad_cnt[7]));
 sky130_fd_sc_hd__dfrtp_2 _428_ (.CLK(clk),
    .D(_000_),
    .RESET_B(rst_n),
    .Q(\u_deb.cnt[0] ));
 sky130_fd_sc_hd__dfrtp_2 _429_ (.CLK(clk),
    .D(_002_),
    .RESET_B(rst_n),
    .Q(\u_deb.cnt[1] ));
 sky130_fd_sc_hd__dfrtp_2 _430_ (.CLK(clk),
    .D(_003_),
    .RESET_B(rst_n),
    .Q(\u_deb.cnt[2] ));
 sky130_fd_sc_hd__dfrtp_2 _431_ (.CLK(clk),
    .D(_004_),
    .RESET_B(rst_n),
    .Q(\u_deb.cnt[3] ));
 sky130_fd_sc_hd__dfrtp_2 _432_ (.CLK(clk),
    .D(_005_),
    .RESET_B(rst_n),
    .Q(\u_deb.cnt[4] ));
 sky130_fd_sc_hd__dfrtp_2 _433_ (.CLK(clk),
    .D(_006_),
    .RESET_B(rst_n),
    .Q(\u_deb.cnt[5] ));
 sky130_fd_sc_hd__dfrtp_2 _434_ (.CLK(clk),
    .D(_007_),
    .RESET_B(rst_n),
    .Q(\u_deb.cnt[6] ));
 sky130_fd_sc_hd__dfrtp_2 _435_ (.CLK(clk),
    .D(_008_),
    .RESET_B(rst_n),
    .Q(\u_deb.cnt[7] ));
 sky130_fd_sc_hd__dfrtp_2 _436_ (.CLK(clk),
    .D(_009_),
    .RESET_B(rst_n),
    .Q(\u_deb.cnt[8] ));
 sky130_fd_sc_hd__dfrtp_2 _437_ (.CLK(clk),
    .D(_010_),
    .RESET_B(rst_n),
    .Q(\u_deb.cnt[9] ));
 sky130_fd_sc_hd__dfrtp_2 _438_ (.CLK(clk),
    .D(_001_),
    .RESET_B(rst_n),
    .Q(\u_deb.cnt[10] ));
 sky130_fd_sc_hd__dfrtp_2 _439_ (.CLK(clk),
    .D(_028_),
    .RESET_B(rst_n),
    .Q(tick));
 sky130_fd_sc_hd__dfrtp_2 _440_ (.CLK(clk),
    .D(_013_),
    .RESET_B(rst_n),
    .Q(\u_tick.cnt[0] ));
 sky130_fd_sc_hd__dfrtp_2 _441_ (.CLK(clk),
    .D(_019_),
    .RESET_B(rst_n),
    .Q(\u_tick.cnt[1] ));
 sky130_fd_sc_hd__dfrtp_2 _442_ (.CLK(clk),
    .D(_020_),
    .RESET_B(rst_n),
    .Q(\u_tick.cnt[2] ));
 sky130_fd_sc_hd__dfrtp_2 _443_ (.CLK(clk),
    .D(_021_),
    .RESET_B(rst_n),
    .Q(\u_tick.cnt[3] ));
 sky130_fd_sc_hd__dfrtp_2 _444_ (.CLK(clk),
    .D(_022_),
    .RESET_B(rst_n),
    .Q(\u_tick.cnt[4] ));
 sky130_fd_sc_hd__dfrtp_2 _445_ (.CLK(clk),
    .D(_023_),
    .RESET_B(rst_n),
    .Q(\u_tick.cnt[5] ));
 sky130_fd_sc_hd__dfrtp_2 _446_ (.CLK(clk),
    .D(_024_),
    .RESET_B(rst_n),
    .Q(\u_tick.cnt[6] ));
 sky130_fd_sc_hd__dfrtp_2 _447_ (.CLK(clk),
    .D(_025_),
    .RESET_B(rst_n),
    .Q(\u_tick.cnt[7] ));
 sky130_fd_sc_hd__dfrtp_2 _448_ (.CLK(clk),
    .D(_026_),
    .RESET_B(rst_n),
    .Q(\u_tick.cnt[8] ));
 sky130_fd_sc_hd__dfrtp_2 _449_ (.CLK(clk),
    .D(_027_),
    .RESET_B(rst_n),
    .Q(\u_tick.cnt[9] ));
 sky130_fd_sc_hd__dfrtp_2 _450_ (.CLK(clk),
    .D(_014_),
    .RESET_B(rst_n),
    .Q(\u_tick.cnt[10] ));
 sky130_fd_sc_hd__dfrtp_2 _451_ (.CLK(clk),
    .D(_015_),
    .RESET_B(rst_n),
    .Q(\u_tick.cnt[11] ));
 sky130_fd_sc_hd__dfrtp_2 _452_ (.CLK(clk),
    .D(_016_),
    .RESET_B(rst_n),
    .Q(\u_tick.cnt[12] ));
 sky130_fd_sc_hd__dfrtp_2 _453_ (.CLK(clk),
    .D(_017_),
    .RESET_B(rst_n),
    .Q(\u_tick.cnt[13] ));
 sky130_fd_sc_hd__dfrtp_2 _454_ (.CLK(clk),
    .D(_018_),
    .RESET_B(rst_n),
    .Q(\u_tick.cnt[14] ));
 sky130_fd_sc_hd__dfrtp_2 _455_ (.CLK(clk),
    .D(_043_),
    .RESET_B(rst_n),
    .Q(good_cnt[0]));
 sky130_fd_sc_hd__dfrtp_2 _456_ (.CLK(clk),
    .D(_044_),
    .RESET_B(rst_n),
    .Q(good_cnt[1]));
 sky130_fd_sc_hd__dfrtp_2 _457_ (.CLK(clk),
    .D(_045_),
    .RESET_B(rst_n),
    .Q(good_cnt[2]));
 sky130_fd_sc_hd__dfrtp_2 _458_ (.CLK(clk),
    .D(_046_),
    .RESET_B(rst_n),
    .Q(good_cnt[3]));
 sky130_fd_sc_hd__dfrtp_2 _459_ (.CLK(clk),
    .D(_047_),
    .RESET_B(rst_n),
    .Q(good_cnt[4]));
 sky130_fd_sc_hd__dfrtp_2 _460_ (.CLK(clk),
    .D(_048_),
    .RESET_B(rst_n),
    .Q(good_cnt[5]));
 sky130_fd_sc_hd__dfrtp_2 _461_ (.CLK(clk),
    .D(_049_),
    .RESET_B(rst_n),
    .Q(good_cnt[6]));
 sky130_fd_sc_hd__dfrtp_2 _462_ (.CLK(clk),
    .D(_050_),
    .RESET_B(rst_n),
    .Q(good_cnt[7]));
 sky130_fd_sc_hd__dfrtp_2 _463_ (.CLK(clk),
    .D(_051_),
    .RESET_B(rst_n),
    .Q(\u_fsm.state[0] ));
 sky130_fd_sc_hd__dfrtp_2 _464_ (.CLK(clk),
    .D(_052_),
    .RESET_B(rst_n),
    .Q(\u_fsm.state[1] ));
 sky130_fd_sc_hd__dfrtp_2 _465_ (.CLK(clk),
    .D(_053_),
    .RESET_B(rst_n),
    .Q(\u_fsm.state[2] ));
 sky130_fd_sc_hd__dfrtp_2 _466_ (.CLK(clk),
    .D(_054_),
    .RESET_B(rst_n),
    .Q(\u_fsm.mode_r[0] ));
 sky130_fd_sc_hd__dfrtp_2 _467_ (.CLK(clk),
    .D(_055_),
    .RESET_B(rst_n),
    .Q(\u_fsm.mode_r[1] ));
 sky130_fd_sc_hd__dfrtp_2 _468_ (.CLK(clk),
    .D(_056_),
    .RESET_B(rst_n),
    .Q(sensor_clean));
 sky130_fd_sc_hd__dfrtp_2 _469_ (.CLK(clk),
    .D(_011_),
    .RESET_B(rst_n),
    .Q(bad_inc));
 sky130_fd_sc_hd__dfrtp_2 _470_ (.CLK(clk),
    .D(_012_),
    .RESET_B(rst_n),
    .Q(good_inc));
 sky130_fd_sc_hd__dfrtp_2 _471_ (.CLK(clk),
    .D(_057_),
    .RESET_B(rst_n),
    .Q(\u_fsm.secs[0] ));
 sky130_fd_sc_hd__dfrtp_2 _472_ (.CLK(clk),
    .D(_058_),
    .RESET_B(rst_n),
    .Q(\u_fsm.secs[1] ));
 sky130_fd_sc_hd__dfrtp_2 _473_ (.CLK(clk),
    .D(_059_),
    .RESET_B(rst_n),
    .Q(\u_fsm.secs[2] ));
 sky130_fd_sc_hd__dfrtp_2 _474_ (.CLK(clk),
    .D(_060_),
    .RESET_B(rst_n),
    .Q(\u_fsm.secs[3] ));
 sky130_fd_sc_hd__dfrtp_2 _475_ (.CLK(clk),
    .D(_061_),
    .RESET_B(rst_n),
    .Q(\u_fsm.secs[4] ));
 sky130_fd_sc_hd__dfrtp_2 _476_ (.CLK(clk),
    .D(_062_),
    .RESET_B(rst_n),
    .Q(\u_fsm.secs[5] ));
endmodule
