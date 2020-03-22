## Login Fecth Contracts

### Login

!!! info "In"
    ```python
    import shioaji as sj
    api = sj.Shioaji()
    api.login(
        person_id='YOUR_ID', 
        passwd='YOUR_PASSWORD', 
        contracts_cb=lambda security_type: print(f"{repr(security_type)} fetch done.")
    )
    ```

!!! done "Out"
    ```python
    [FutureAccount(person_id='', broker_id='', account_id='', signed=True, username=''),
        StockAccount(person_id='', broker_id='', account_id='', signed=True, username='')]
    <SecurityType.Index: 'IND'> fetch done.
    <SecurityType.Future: 'FUT'> fetch done.
    <SecurityType.Option: 'OPT'> fetch done.
    <SecurityType.Stock: 'STK'> fetch done.
    ```

After login success we will start to fetch all kind of contract but fetching will not block other action. So how to know the fetch action is done ? We have contracts_cb in `login` function that you can pass your customize function define how to do when the contract fetched. In this exmaple, we just print what kind of contract when it has been fetched.

!!! note "contracts_timeout"
    If you set contracts_timeout inside `login` from 0 to 10000, it will block the fetch and wait 10 second until the contract is back.
    ```python
    api.login(
        person_id='YOUR_ID', 
        passwd='YOUR_PASSWORD', 
        contracts_timeout=10000,
    ) 
    ```

## Contracts


!!! info "In"
    ```python
    api.Contracts
    ```

!!! done "Out"
    ```python
    Contracts(Indexs=(OTC, TSE), Stocks=(OES, OTC, TSE), Futures=(BRF, CAF, CBF, CCF, CDF, CEF, CFF, CGF, CHF, CJF, CK1, CKF, CLF, CM1, CMF, CNF, CQF, CRF, CSF, CU1, CUF, CWF, CXF, CYF, CZ1, CZF, DCF, DD1, DDF, DEF, DFF, DGF, DHF, DIF, DJF, DKF, DLF, DNF, DOF, DPF, DQF, DSF, DUF, DVF, DWF, DXF, DYF, DZF, EEF, EGF, EHF, EMF, EPF, ERF, EXF, EY1, EYF, FEF, FFF, FGF, FKF, FQF, FRF, FTF, FVF, FWF, FXF, FYF, FZF, G2F, GAF, GCF, GDF, GHF, GIF, GJF, GLF, GMF, GNF, GOF, GRF, GTF, GUF, GWF, GXF, GZF, HAF, HBF, HCF, HHF, HIF, HLF, HOF, HS1, HSF, HY1, HYF, IA1, IAF, IHF, IIF, IJF, IMF, IOF, IPF, IQF, IRF, ITF, IXF, IYF, IZF, JBF, JFF, JNF, JPF, JSF, JWF, JZF, KAF, KB1, KBF, KCF, KDF, KFF, KGF, KIF, KKF, KLF, KOF, KPF, KSF, KWF, LBF, LCF, LE1, LEF, LIF, LMF, LOF, LQF, LRF, LTF, LUF, LVF, LWF, LXF, LYF, MAF, MBF, MCF, MJF, MKF, MPF, MQF, MVF, MX1, MXF, MYF, NAF, NBF, NCF, NDF, NEF, NGF, NHF, NIF, NJF, NLF, NMF, NNF, NOF, NQF, NSF, NUF, NVF, NWF, NXF, NYF, NZF, OAF, OBF, OCF, ODF, OEF, OGF, OHF, OJF, OKF, OLF, OMF, OOF, OPF, OQF, ORF, OS1, OSF, OTF, OUF, OVF, OWF, OXF, OYF, OZF, PAF, PBF, PCF, PDF, PEF, PFF, PGF, PHF, PIF, PJF, PKF, PLF, PMF, PNF, POF, PPF, PQF, RHF, RTF, SPF, T5F, TGF, TJF, TXF, UDF, UNF, XAF, XBF, XEF, XIF, XJF), Options=(CAO, CBO, CCO, CDO, CEO, CFO, CGO, CHO, CJO, CKO, CLO, CMO, CNO, CQO, CRO, CSO, CXO, CZO, DCO, DEO, DFO, DGO, DHO, DJO, DKO, DLO, DNO, DOO, DPO, DQO, DSO, DUO, DVO, DWO, DXO, GIO, GXO, HCO, IJO, LOO, NYA, NYO, NZO, OAO, OBO, OCO, OJO, OKO, OOO, OZO, RHO, RTO, TEO, TFO, TGO, TX1, TXO))
    ```
If your contracts have been downloaded, will see the output like above. If part of that kind contract download not yet, It will still be `None`.

### Stock Contract


!!! info "In"
    ```python
    contract_2890 = api.Contracts.Stocks["2890"]
    contract_2890
    ```

!!! done "Out"
    ```python
    Stock(exchange=<Exchange.TSE: 'TSE'>, code='2890', symbol='TSE2890', name='永豐金', category='17', limit_up=11.3, limit_down=9.27, update_date='2020/03/18', day_trade=<DayTrade.Yes: 'Yes'>)
    ```

### Futures Contract


!!! info "In"
    ```python hl_lines="1 3"
    contract_txf = api.Contracts.Futures['TXFC0']

    contract_txf = api.Contracts.Futures.TXF.TXF202003
    contract_txf
    ```

!!! done "Out"
    ```python
    Future(code='TXFC0', symbol='TXF202003', name='臺股期貨', category='TXF', delivery_month='202003', underlying_kind='I', limit_up=10308.0, limit_down=8434.0, update_date='2020/03/18')
    ```
In above two highlight lines, you can get same contract with different way.


### Options Contract



!!! info "In"
    ```python
    api.Contracts.Options
    ```

!!! done "Out"
    ```python
    (CAO, CBO, CCO, CDO, CEO, CFO, CGO, CHO, CJO, CKO, CLO, CMO, CNO, CQO, CRO, CSO, CXO, CZO, DCO, DEO, DFO, DGO, DHO, DJO, DKO, DLO, DNO, DOO, DPO, DQO, DSO, DUO, DVO, DWO, DXO, GIO, GXO, HCO, IJO, LOO, NYA, NYO, NZO, OAO, OBO, OCO, OJO, OKO, OOO, OZO, RHO, RTO, TEO, TFO, TGO, TX1, TXO)
    ```

Options object show all avaiable options product.

!!! info "In"
    ```python
    api.Contracts.Options["TXO10000C0"]
    ```

!!! done "Out"
    ```python
    Option(code='TXO10000C0', symbol='TXO202003010000C', name='臺指選擇權', category='TXO', delivery_month='202003', strike_price=10000.0, option_right=<OptionRight.Call: 'C'>, underlying_kind='I', limit_up=945.0, limit_down=0.1, update_date='2020/03/18')
    ```

Get options by code.

!!! info "In"
    ```python
    api.Contracts.Options.TX4.TX420200308800P
    ```

!!! done "Out"
    ```python
    Option(code='TX408800O0', symbol='TX420200308800P', name='臺指選擇權', category='TX4', delivery_month='202003', strike_price=8800.0, option_right=<OptionRight.Put: 'P'>, underlying_kind='I', limit_up=1090.0, limit_down=0.1, update_date='2020/03/18')
    ```

Get options with readable way.

!!! info "In"
    ```python
    api.Contracts.Options.TXO.TXO202003010000P
    ```

!!! done "Out"
    ```python
    Option(code='TXO10000O0', symbol='TXO202003010000P', name='臺指選擇權', category='TXO', delivery_month='202003', strike_price=10000.0, option_right=<OptionRight.Put: 'P'>, underlying_kind='I', limit_up=1570.0, limit_down=0.1, update_date='2020/03/18')
    ```

Get put options with readable way.


### Index Contract


!!! info "In"
    ```python
    api.Contracts.Indexs.TSE
    ```

!!! done "Out"
    ```python
    TSE(TSE001, TSE015, TSE016, TSE017, TSE018, TSE019, TSE020, TSE022, TSE023, TSE024, TSE025, TSE026, TSE028, TSE029, TSE030, TSE031, TSE032, TSE033, TSE035, TSE036, TSE037, TSE038, TSE039, TSE040, TSE041, TSE042, TSE043, TSE004, TSE005)
    ```

!!! info "In"
    ```python
    api.Contracts.Indexs.TSE.TSE001
    ```

!!! done "Out"
    ```python
    Index(exchange=<Exchange.TSE: 'TSE'>, code='001', symbol='TSE001', name='加權')
    ```

This contract is not avaiable to place order, but allow to subscribe the quote. It will be disuccess at net topic.


## Conclusion
Contract object will be used by a lot of place like place order and subscribe quote etc... So Keep in mind how to get the contract you want to use.