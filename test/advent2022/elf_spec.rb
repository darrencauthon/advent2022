# frozen_string_literal: true

require 'test_helper'

describe Advent2022::Elf do
  describe :from_calories do
    let(:elves) { Advent2022::Elf.from_calories(calorie_list) }

    describe 'given example' do
      let(:calorie_list) do
        <<~TEXT
          1000
          2000
          3000

          4000

          5000
          6000

          7000
          8000
          9000

          10000
        TEXT
      end

      it 'should create five elves' do
        _(elves.count).must_equal 5
        _(elves.select { |x| x.is_a?(Advent2022::Elf) }.count).must_equal 5
      end

      it 'should set the calorie totals' do
        _(elves[0].calories).must_equal 6000
        _(elves[1].calories).must_equal 4000
        _(elves[2].calories).must_equal 11_000
        _(elves[3].calories).must_equal 24_000
        _(elves[4].calories).must_equal 10_000
      end

      describe 'figuring out who to ask for snacks' do
        describe 'asking for elves that do not have the most' do
          let(:result) { elf.find_someone_to_ask_for_snacks(elves) }

          [0, 1, 2, 4].each do |elf_index|
            describe "elf # #{elf_index}" do
              let(:elf) { elves[elf_index] }

              it 'should return the elf with the most calories' do
                _(result).must_be_same_as elves[3]
              end
            end
          end

          describe 'the elf with the most' do
            let(:elf) { elves[3] }

            it 'should return the elf with second-most calories' do
              _(result).must_be_same_as elves[2]
            end
          end
        end
      end
    end

    describe 'the real test file' do

      let(:calorie_list) do
        <<~TEXT
          1000
        TEXT
      end

      let(:calorie_list) do
        <<~TEXT
          17034
          13495
          7368
          13905

          68034

          7796
          10348
          5088
          8836

          15061
          1842
          7047

          2477
          6629
          7998
          4235
          6505
          2875
          6059
          9423
          5315

          4054
          6388
          5278
          4163
          10438
          10821
          2650

          6424
          2420
          10363
          4275
          1876
          6357
          6364

          5123
          1271
          3991
          2792
          2513
          4890
          2900
          7820
          6020
          4612
          3109

          9072
          18898
          13848
          11609

          1793
          1434
          2288
          4573
          5087
          7366
          3233
          3052
          5754
          1418
          6255

          5372
          2497
          2289
          6782
          4154
          5081
          5984
          3164
          4111
          2951
          6928
          1798
          6525

          19803
          23713
          7818

          7662
          2324
          8206
          5409
          8225
          5513
          2664
          3870
          1428
          5189

          5603
          8006
          1486
          1469
          5413
          5638
          2242
          8559
          6333
          1389

          4187
          2794
          1067
          1632
          1679
          4572
          5964
          1170
          4199
          5612
          6321
          6658
          3737

          2093
          2221
          4741
          5892
          3781
          4034
          1030
          1542
          1547
          5429
          1896
          1371
          4041
          2522

          15827
          1404
          8514
          8983
          6878

          56181

          11350
          12192
          12659
          9552
          14896

          5308
          6289
          5069
          3594
          1499
          1034
          5546
          3430
          2292
          2825
          4427
          2315
          2738

          5102
          3295
          6423
          1653
          6199
          2459
          1569
          6588
          5691
          4490
          7235

          6470
          9298
          10054
          6316
          1773
          6657
          4398
          4420

          25785
          1283

          9366
          10257
          3221
          2899
          7247
          4711

          4108
          6265
          4824
          6589
          2869
          4826
          5853
          1770
          5627
          6581
          2591
          2107

          1300
          1774
          9933
          6743
          11425
          8454
          8080

          1292
          6230
          1017
          5895
          2718
          6219
          5511
          7161
          1201
          4493

          3268
          1306
          5417
          4691
          13018
          13021

          9165
          12000
          7531
          10585
          2802
          10764
          2744

          8261
          4961
          3019
          3309
          6632
          7955
          3538
          7392

          2730
          4479
          1909
          6013
          5214
          1188
          5074
          1589
          1103
          1393
          1745
          4162
          4231
          4197
          3307

          1246
          5200
          2648
          6419
          5659
          7380
          4479
          4589
          4108
          7290
          5514
          4406

          4256
          5658
          9668
          8745
          6698
          11874
          9277

          19436
          11206
          7547
          1540

          4757
          11223
          9685
          6113
          10587
          5328
          1896

          3312
          2758
          3528
          3501
          1933
          5876
          3471
          1208
          3892
          5302
          2674
          1282
          1195
          5675
          5753

          3127
          21845

          5244
          9557
          8744
          2783
          6549
          6225
          1122
          7317
          7574

          5154
          2790
          3239
          6496
          7433
          5770
          3835
          6644
          5503
          1273
          1244
          7098

          4307
          1882
          9426
          7432
          3558
          5765
          9957
          6974

          9510
          35767

          3109
          5208
          4756
          1226
          5645
          7133
          2308
          5784
          5194
          2739

          1850
          9199
          6957
          6793
          9231
          9094
          7275
          2519

          52651

          2337
          6455
          5574
          3001
          1296
          5120
          5175
          1704
          7041
          2118
          3446
          2219

          10123
          2817
          6853
          11370
          9490

          11194
          1887
          1922
          2390
          10687
          3573
          8476

          3646
          1365
          5255
          1882
          5705
          2428
          5833
          2242
          3674
          2254
          5141
          1317
          4873
          4421
          4178

          7264
          12898
          4423
          1871
          4998
          10540

          9143
          9081
          6136
          6734
          6955
          6956
          5693
          8110

          8820
          11554
          5474
          9848

          7445
          8434
          7883
          3523
          2562
          5174
          3178
          5766
          5322
          5347

          2666
          1556
          4772
          5053
          5874
          5711
          1684
          3351
          4037
          4770
          4755
          6280
          1326
          5756

          4322
          10058
          6727
          3217
          9987
          3195
          10711
          5728

          8382
          32068

          3385
          1384
          3110
          1205
          2932
          4065
          3886
          5950
          6443
          2657
          2229
          4438
          2100
          3961

          1654
          2028
          8414
          3662
          4270
          3923
          4827
          5443
          2710
          3406

          8262
          6401
          2115
          7528
          1359
          1934
          1560
          3271
          8459
          8387

          8437
          5394
          5589
          5243
          3421
          5228
          3601

          6306
          5779
          5119
          2453
          1289
          1164
          1175
          7252
          7215
          2632
          6832
          2304

          4788
          3723
          5887
          2748
          7350
          5974
          6015
          1545
          1092
          2524
          4130
          7297

          3455
          5668
          1435
          2738
          5520
          4374
          2594
          4144
          4457
          6479
          1230
          3682
          6157
          4284

          10449
          6988
          2505
          6083
          3844
          2655
          8953

          6061
          5493
          4922
          3375
          1273
          4181
          4643
          4039
          1482
          5952
          3468
          4719
          4101
          4702

          1135
          3886
          3308
          3986
          2662
          1814
          5813
          1079
          4916
          5059
          2155
          1404
          2398
          2730
          1972

          5868
          5201
          3725
          4905
          1655
          3585
          6339
          5563
          6869
          4779
          4072
          5106
          3587

          5997
          1240
          2115
          4558
          1572
          7031
          1568
          3230
          4081
          3767
          1916
          5388

          6672
          7355
          7362
          6232
          6112
          7095
          5350
          8343
          8171
          8331

          4370
          11625
          6923
          1583
          9520
          11093
          11708

          4475
          23713

          6310
          6536
          3243
          2910
          2861
          5076
          6562
          3924
          5933
          4044
          1572
          2351
          6665

          6994
          5704
          5165
          7364
          5819
          1816
          3929
          6967
          1009
          2528
          6107
          6954

          6855
          11865
          9195
          18609

          5582
          3987
          7772
          2106
          1006
          5441
          6201
          7748
          1386
          1898
          7790

          5332
          5371
          3515
          6367
          6657
          2677
          4790
          2448
          3401
          1668
          4425
          3758
          5385

          4105
          3883
          4389
          2214
          1943
          2510
          2544
          1330
          6275
          1492
          5837
          1830
          4440

          5041

          40092

          34451

          14820
          10096
          24218

          2095
          3608
          1467
          6098
          9586
          4062
          6745
          1217
          2074

          5660
          7032
          7666
          2711
          3050
          2260
          6274
          4672
          1028
          6916
          7861

          37401
          29831

          15255
          6714
          2378
          13864

          7618
          15264
          8496
          7847
          8750

          6392
          4892
          1200
          2133
          2879
          6033
          5634
          1979
          5066
          3965
          4734
          1761
          5627
          2369

          19691
          16626
          6806

          3594
          1824
          4264
          5058
          2286
          6836
          4687
          4016
          2660
          7224
          6390

          6213
          6396
          5387
          5318
          3022
          5080
          6098
          3699
          2437
          6430
          6091
          1255
          2480
          2490

          8795
          3287
          14228
          10078

          6720
          3431

          13856
          2609

          1683
          1241
          5941
          8021
          11838

          3961
          3033
          4069
          3200
          2598
          3133
          6007
          2048
          2850
          2605
          5111
          3726
          1994
          1910
          2289

          11960
          3800
          11919
          3808
          12138
          7118

          60979

          10777
          8860
          3736
          3591
          12500
          8963

          3474
          3027
          5923
          1874
          3555
          5312
          5568
          1796
          2831
          3105
          3501
          4378
          5999
          4528
          5948

          2493
          13969

          6992
          14112
          3430
          14233
          13381

          17059
          5737
          1290
          12844

          6302
          4418
          2067
          5059
          2085
          3061
          4411
          5662
          4097
          3333
          2182
          1090
          4185

          4811
          1351
          6050
          7344
          2745
          6588
          3506
          2056
          4229
          4256
          1853
          5912

          9673
          2207
          4646
          2680
          12985
          3873

          1110
          6118
          4411
          6331
          1668
          6023
          6977
          5049
          6669
          4421
          5027
          3131

          9968
          2987
          5041
          18431

          7436
          5660
          15858
          7130
          12737

          5232
          9051
          10275
          9404
          3384
          5719
          5724
          10218

          4350
          2456
          7892
          1318
          6932
          7890
          9595
          4605
          7672

          2666
          9981
          1959
          5686
          3655
          2763
          6737
          8621

          9915
          5955
          10523
          3976
          4166
          9602
          2985
          6160

          25160
          18830
          7409

          1322
          1283
          3839
          3054
          5782
          4615
          2579
          3332
          3046
          3634
          2428
          1373
          5638

          13941

          2653
          14138
          2355
          12340
          6598

          4857
          9417
          13144
          9072
          4174

          1946
          6030
          5875
          1649
          1757
          2198
          2673
          3743
          1357
          1134
          1602

          2791
          10432
          4037
          2767
          11295
          11255
          9762

          9232
          11015
          21925

          6365
          1170
          4253
          5122
          5390
          7061
          7781
          4584
          6362
          6367
          5321

          23166
          21313
          16147

          7915
          10734
          6921
          4796
          6442
          3520
          4416
          5702

          31627
          21575

          9569
          2837
          3816
          5052
          9399
          6174
          3291
          2513
          2932

          6255
          14356
          5389
          18970

          26896
          3552

          19037
          5180
          6855

          4929
          5212
          15135

          1114
          1338
          8702
          7914
          6690
          5981
          6129
          4246
          4660

          2696
          4528
          4053
          5982
          2308
          6097
          1933
          6410
          4851
          4526
          5705
          5510
          3951

          4693
          4906
          4570
          1161
          2974
          4099
          5423
          4146
          3305
          3057
          2079
          6187
          3196
          2285

          6300
          6253
          5892
          3636
          5373
          5345
          1990
          7456
          1218
          4220
          3845

          3028
          1790
          2104
          6750
          2516
          2482
          2574
          6806
          1613
          2279
          5389
          3979
          6672

          48619

          15159
          1029

          13352
          5081

          6292
          6989
          5568
          6181
          2773
          4529
          3205
          1134
          6416
          5199
          2830
          4813

          4718
          5530
          5036
          2874
          2658
          2353
          5402
          3476
          1924
          3147
          2883
          6331

          14524
          30079

          4071
          4399
          3021
          5165
          2110
          6084
          1863
          3614
          4336
          5688
          1960

          25783
          28718

          13615
          1645
          11870
          8796

          5951
          6447
          2501
          7770
          2999
          6715
          8707
          5124
          6215
          3113

          6241
          2189
          1752
          1812
          2727
          5703
          2710
          6113
          1732
          6237

          7990
          6499
          8481
          3443
          9375
          10439
          5892
          2758

          7919
          8753
          5124
          6388
          8026
          7326
          4457
          4352
          5781
          5549

          49501

          10500
          23249

          8352
          9128
          4905
          5833
          1218
          2859
          11489

          6104
          6546
          6243
          6716
          3511
          3433
          4327
          2453
          2887
          5007
          4404
          4506
          2315

          7269
          3193
          3535
          2566
          2745
          6483
          3880
          5042
          6931
          4519
          3442
          6667

          16325
          7397
          21391

          12648
          9268
          8280
          1497
          13788
          3384

          1373
          2171
          2065
          5461
          4854
          2427
          5814
          2197
          4077
          5138
          6861
          6083
          1995

          4817
          3501
          1937
          4840
          4299
          6083
          1330
          2737
          5361
          5941
          2762
          3191
          5530
          3913
          4139

          10082
          7801
          5221
          4785
          6847
          4672
          8824
          4507

          25999
          21078

          34976
          27760

          6972
          2714
          1051
          4905
          1102
          6332
          6113
          4218
          7125
          4372
          4669

          3986
          10129
          16175
          6193
          11015

          6260
          5523
          2032
          5304
          5167
          2908
          6518
          5491
          1718
          6229
          3264
          4899
          2873

          6613
          4234
          6130
          1017
          7986
          7727
          3564
          8250

          12031
          11879
          11614
          13472
          8471
          7369

          4315
          1636
          6292
          6768
          3788
          4643
          6397
          7402
          1379
          3518
          6438
          6196

          5667
          7559
          13899
          18285

          5266
          34337

          29305
          22273

          9371
          5132
          1652
          2573
          8840
          8636
          4700
          3145
          7728

          5864
          4845
          3567
          1247
          3070
          1378
          2836
          5574
          2398
          5191
          3520
          1395
          4933
          5530
          2656

          5504
          5002
          4944
          4903
          3186
          1446
          3886
          1506
          2669
          5362
          2456
          2150
          4468
          5212
          2319

          1543
          1581
          4295
          5685
          1977
          4361
          2381
          5288
          5557
          3159
          4833
          5577
          5892

          8109
          4061

          7132
          2394
          9579
          7360
          9023
          8589
          5666
          3108

          25582
          3178
          2616

          5742
          2967
          2577
          2141
          6022
          1148
          1971
          1779
          5039
          5210
          1043
          1633
          2697

          5024
          1439
          3535
          4723
          3271
          3904
          4303
          2706
          2878
          2882
          4417
          5580
          2685
          5028
          2243

          4788
          2903
          6717
          5514
          4434
          6396
          3370
          2964
          6940
          3018
          1328
          6527
          4651

          5796
          7350
          15943
          7116
          11040

          9110
          1795
          10997
          9811
          5571
          8786
          8690

          1173
          4256
          2326
          2947
          3133
          4930
          1653
          4548
          3971
          4837
          4084
          3362
          4144
          4015
          2631

          22258

          1270
          8084
          3413
          1180
          7841
          3467
          1068
          3763
          7479
          2988
          5377

          4833
          2453
          2985
          5365
          1128
          2411
          2103

          29169

          9451
          5237
          3547
          13513
          3528
          4937

          14834
          6011
          11685
          17950

          3040
          4721
          1809
          5755
          2326
          4373
          1018
          1433
          3180
          3173
          1313
          4158
          1867
          3349
          5629

          4201
          12336
          18265
          14378

          5248
          2091
          6755
          4523
          6049
          1183
          3834
          1242
          6517
          1561
          6666
          5117
          5600

          2907
          1482
          2765
          8934
          1654
          3786
          8807
          8924

          6131
          4724
          4774
          1030
          6359
          4452
          5557
          1501
          5743
          2434
          1809
          4657
          5609
          4773

          24218
          26128

          11710
          8138
          7143
          7236
          11903
          4547
          2419

          1474
          13551
          6009
          12136
          13007
          9816

          7230
          3816
          5352
          5591

          7237
          5129
          2630
          3158
          4131
          1324
          2439
          2828
          1922
          6051
          3871
          3577

          21875
          13945
          15782

          10156
          15069
          18789
          6685

          6292
          12221
          17527

          11396
          11684
          2362
          12055
          6888
          9393
          11909

          37154
          17860

          22974

          3693
          2551
          3077
          7444
          8973
          5966
          2728

          2554
          3119
          2796
          1993
          3959
          4421
          2691
          3002
          4104
          5876
          2748
          3633
          3567
          2280
          3852

          9583
          4003

          3100
          4338
          6077
          4813
          3223
          2373
          1607
          7412
          7798
          7684

          4354
          3140
          2957
          5563
          6119
          2571
          1742
          3603
          5854
          3755
          2827

          1302
          4160
          1944
          1215
          1603
          5361
          5959
          3698
          5329
          3118
          4941
          1624
          4755
          3249
          5205

          4707
          3243
          6299
          3689
          8496
          8594
          4187

          5986
          4431
          1006
          1707
          1202
          4184
          3438
          5148
          4472
          6561
          5882
          5693

          11346
          8748
          12659

          2456
          2147
          1401
          5715
          5128
          5560
          1635
          3947
          5021
          4850
          1414
          2316
          5949
          4779
          2867

          2530
          3901
          7034
          4665
          7109
          2416
          5461
          8825

          5287
          4195
          9609
          5697
          3135
          6638
          2780
          6876
          6032

          17278
          18581
          4060
          13610

          14199
          19618
          4500

          4423
          15765
          6614
          11352
          1941

          30048
          17442

          6881
          8630
          10121
          9792
          6340
          8848
          7245
          7764

          5138
          9396
          2975
          5036
          6776
          7205
          8991
          3595
          4894

          1065
          4272
          2155
          2655
          9405
          10274
          8344

          8234
          3276
          1914
          11975
          8096

          7358
          13681
          13640
          1543
          13683

          24588
          22649

          5034
          2818
          4103
          2328
          2311
          4241
          6145
          2694
          5191
          4266
          6477
          6412
          4566
          3077

          4442
          2199
          7109
          6674
          5257
          4611

          2544
          1810
          1941
          3389
          3473
          1813
          1232
          3782
          1733
          4191
          3953
          3793
          4832
          2560
          1321

          3331
          2853
          5284
          1989
          4543
          4447
          5852
          2847
          3260
          5583
          5429
          2967
          3563
          1925
          2799

          9448
          3662
          6703
          7356
          1600

          4050
          6662
          7169
          2836
          2231
          1149
          5204
          4275
          6231
          7478
          1388
          6980

          2185
          1526
          1640
          9156
          6623
          8572
          7426
          9419

          10637
          9584
          8293
          7473
          3529
          7532

          3987
          12127
          10749
          3399
          11041
          4600
          9896

          3728
          1878
          5192
          3264
          6367
          4429
          6449
          7005
          4883
          5359
          2112
          6228

          13574
          6574
          11518
          11909
          13625

          16357
          19546
          7520
          8254

          2122
          1712
          2729
          2847
          1157
          2895
          4850
          2805
          5603
          2321
          6113
          5468
          1230
          2385

          3947
          3326
          2395
          5776
          4035
          3206
          5845
          6429
          5039
          4540
          5047
          4237
          6953

          1738
          8822
          11967
          10160
          4327
          8382
          2686

          2778
          6909
          7649
          2787
          8749
          1720
          6863
          5515
          8631
          3257

          1369
          2470
          2726
          7415
          5232
          1919
          2981
          4437
          3168
          6412
          7072
          3201

          19275
          10942

          12930
          12593
          9356
          5680
          10193
          4399

          11119
          10651
          8687
          12028
          1713
          8311
          10089

          3752

          10177
          9060
          4817
          3564
          7272
          10452

          1563
          3885
          3191
          6312
          5524
          5207
          3669

          8105
          7217
          4719
          9214
          3973
          10782
          10563

          10142
          4264

          7283

          15973
          9578
          9884
          4478
          10540

          5548
          4654
          3024
          2243
          3985
          1220
          3461
          1042
          1845
          2888
          3931
          2356
          1430
          3373
          4604

          8036
          3016
          3510
          2659
          8700
          1539
          1202
          2116
          4351
          7388

          2995
          7003
          8022
          2012
          1976
          3938
          3744
          6146
          5056
          7590
          4008

          4459
          12305
          7633
          2742
          12867
          12607

          3791
          5059
          6361
          3008
          4543
          1374
          6821
          5967
          8461
          4241

          1641
          1364
          2037
          2479
          1413
          4250
          5042
          2438
          2855
          3081
          3535
          3966
          3574
          1149
          3606

          3397
          2787
          5638
          2321
          3765
          5617
          4870
          4456
          6681
          1890
          1068
          3609
          3043

          3436
          4011
          5212
          5576
          4139
          1387
          6298
          4179
          4000
          4207
          3302
          1539
          2793
          3551
        TEXT
      end

      describe 'some new elf finding the right elf to ask for snacks' do
        let(:hungry_elf) { Advent2022::Elf.new(calories: 0) }
        let(:stocked_elf) { hungry_elf.find_someone_to_ask_for_snacks(elves) }

        it 'should return the elf with the most' do
          _(stocked_elf.calories).must_equal 71_023
        end
      end
    end
  end
end
