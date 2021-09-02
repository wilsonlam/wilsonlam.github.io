/* IMPORTANT:
 * Run TestingServerBeforeRefreshHostList to check for available server first before doing anything else. This can be done in MasterServer_IP_Port_Request if master server is not available do not enable StartServer!
 * 
 * About RPC being received out of order. If send from A-Z will received Z-A (just wait a frame for each send for it to be in order.)
 * https://forum.unity.com/threads/unitynetworking-rpcs-are-not-received-in-the-order-they-are-sent.245782/
*/
#region LOCAL OPTION
/*
[ ]=([X]PC)([ ]Mobile)([X]host)([X]WIFI)-->([X]PC)([ ]Mobile)([ ]host)([X]client)([X]WIFI)
[X]=([X]PC)([ ]Mobile)([X]host)([X]WIFI)-->([ ]PC)([X]Mobile)([ ]host)([X]client)([X]WIFI)

[X]=([ ]PC)([X]Mobile)([X]host)([X]WIFI)-->([X]PC)([ ]Mobile)([ ]host)([X]client)([X]WIFI)
[X]=([ ]PC)([X]Mobile)([X]host)([X]WIFI)-->([ ]PC)([X]Mobile)([ ]host)([X]client)([X]WIFI) 
*/
#endregion
#region NET OPTION
/*
- Host PC WIFI
[ ]=([X]PC)([ ]Mobile)([X]host)([ ]3G)([X]WIFI)-->([X]PC)([ ]Mobile)([X]client)([ ]3G)([X]WIFI)
[ ]=([X]PC)([ ]Mobile)([X]host)([ ]3G)([X]WIFI)-->([X]PC)([ ]Mobile)([X]client)([X]3G)([ ]WIFI) hotspot???
[X]=([X]PC)([ ]Mobile)([X]host)([ ]3G)([X]WIFI)-->([ ]PC)([X]Mobile)([X]client)([ ]3G)([X]WIFI)
[X]=([X]PC)([ ]Mobile)([X]host)([ ]3G)([X]WIFI)-->([ ]PC)([X]Mobile)([X]client)([X]3G)([ ]WIFI)
- RARE CASE: Host PC 3G Hotspot
[ ]=([X]PC)([ ]Mobile)([X]host)([X]3G)([ ]WIFI)-->([X]PC)([ ]Mobile)([X]client)([ ]3G)([X]WIFI)
[ ]=([X]PC)([ ]Mobile)([X]host)([X]3G)([ ]WIFI)-->([X]PC)([ ]Mobile)([X]client)([X]3G)([ ]WIFI) hotspot???
[ ]=([X]PC)([ ]Mobile)([X]host)([X]3G)([ ]WIFI)-->([ ]PC)([X]Mobile)([X]client)([ ]3G)([X]WIFI)
[ ]=([X]PC)([ ]Mobile)([X]host)([X]3G)([ ]WIFI)-->([ ]PC)([X]Mobile)([X]client)([X]3G)([ ]WIFI)
    
- Host Mobile WIFI
[X]=([ ]PC)([X]Mobile)([X]host)([ ]3G)([X]WIFI)-->([X]PC)([ ]Mobile)([X]client)([ ]3G)([X]WIFI)
[ ]=([ ]PC)([X]Mobile)([X]host)([ ]3G)([X]WIFI)-->([X]PC)([ ]Mobile)([X]client)([X]3G)([ ]WIFI) hotspot???
[X]=([ ]PC)([X]Mobile)([X]host)([ ]3G)([X]WIFI)-->([ ]PC)([X]Mobile)([X]client)([ ]3G)([X]WIFI)
[X]=([ ]PC)([X]Mobile)([X]host)([ ]3G)([X]WIFI)-->([ ]PC)([X]Mobile)([X]client)([X]3G)([ ]WIFI)
- Host Mobile 3G
[X]=([ ]PC)([X]Mobile)([X]host)([X]3G)([ ]WIFI)-->([X]PC)([ ]Mobile)([X]client)([ ]3G)([X]WIFI)
[ ]=([ ]PC)([X]Mobile)([X]host)([X]3G)([ ]WIFI)-->([X]PC)([ ]Mobile)([X]client)([X]3G)([ ]WIFI) hotspot???
[X]=([ ]PC)([X]Mobile)([X]host)([X]3G)([ ]WIFI)-->([ ]PC)([X]Mobile)([X]client)([ ]3G)([X]WIFI)
[X]=([ ]PC)([X]Mobile)([X]host)([X]3G)([ ]WIFI)-->([ ]PC)([X]Mobile)([X]client)([X]3G)([ ]WIFI)

Mobile 3G Internet does Hotspot for other devices work!!!
[X]=([ ]PC)([X]Mobile)([X]host)([X]3G)([ ]Using WIFI Hotspot)-->([ ]PC)([X]Mobile)([X]client)([ ]3G)([X]Using HOST WIFI Hotspot)
[X]=([ ]PC)([X]Mobile)([X]host)([ ]3G)([X]Using WIFI Hotspot)-->([ ]PC)([X]Mobile)([X]client)([X]3G)([ ]Using HOST WIFI Hotspot) Note this room cannot be joined by others!
 * This is consider a local hotspot option private room. Don't use my proxy data. But all local people using the local hotspot will work!
[X]=([ ]PC)([X]Mobile)([X]host)([ ]3G)([X]Using WIFI Hotspot)-->([ ]PC)([X]Mobile)([X]client)([X]3G)([ ]Using HOST WIFI Hotspot) Proxy option let others join as well. But waste my data!!!

*/
#endregion

using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using System;
using System.IO;
using System.Net;
using System.Text.RegularExpressions;
using System.Runtime.Serialization.Formatters.Binary;

namespace WL_MasterServer
{
	[AddComponentMenu("Network_WL/MasterServerNetworkManager")]
    [RequireComponent(typeof(InGameNetworkChat_WL))]
    [RequireComponent(typeof(MasterServer_IP_Port_Request))]
    [RequireComponent(typeof(MasterServerObjectList_Other))]
    [RequireComponent(typeof(NetworkView))]
	[RequireComponent(typeof(NetworkMigrationManager))]
    [RequireComponent(typeof(NetworkDiscoveryCustom))]
    [RequireComponent(typeof(ResourceLoadPathList))]
    [RequireComponent(typeof(SpawnDefinitions))]
	public class MasterServerNetworkManager : MonoBehaviour
	{
	    #region Variables
	    [ReadOnly] public NetworkType networkType;
        [ReadOnly] public NetworkConnectionError masterServerResponse;
		[ReadOnly] public NetworkConnectionError networkResponse;
		[ReadOnly] public PeerTypeDesired peerTypeDesired;
        [HideInInspector] public NetworkView thisNetworkView;

	    [Tooltip("Host Migration (Not fully functional yet)")] public bool useHostMigration = true;
        [Tooltip("Enable Auto LAN data refresh.")] public UseNetworkDiscoveryCustom useNetworkDiscoveryCustom;
		[HideInInspector] public NetworkMigrationManager m_NetworkMigrationManager;

        /// <summary>
        /// Use resourceLoadPathListScript.resourcesLoadList[0].filePathList[index].LoadAsGameObject for the DEFAULT "NETWORK OBJECT LIST".
        /// </summary>
        public static ResourceLoadPathList resourceLoadPathListScript;
	    public NetworkGameInfo m_NetworkGameInfo;
        public CPU_Load CPULoad;
	    public static MasterServerNetworkManager singleton;

	    [Header("Server Info")]
		public ServerSetting serverSetting;

	    #region Master Server Variables
	    [Header("Master Server Options")]
	    public bool islocalHostMasterServer;
        public LocalPorts localPorts;

	    public HostData[] hostList;

	    [Header("Master Servers & NAT Facilitator")]
		public MasterNATProxyServer masterNATProxyServers;
	    #endregion

		#region Set Get etc.
		[Header("Network Setting:")]
		[SerializeField, ReadOnly] private bool isLAN;
		public bool IsLAN
		{
			get { return isLAN; }
			set { isLAN = value; }
		}
		[SerializeField, ReadOnly] private bool useWifi;
		public bool UseWifi
		{
			get { return useWifi; }
		}
		[SerializeField, ReadOnly] private bool useNat;
		public bool UseNat
		{
			get { return useNat; }
			set
            {
                serverSetting.mySetting.inputLanNet.UseNat = value;
                useNat = value;
            }
		}
        public bool SetUseNat
        {
            set
            {
                //serverSetting.mySetting.inputLanNet.UseNat = value;
                useNat = value;
            }
        }
		[SerializeField, ReadOnly] private bool useProxy;   // NOTE: UseProxy is activated for PUBLIC IP ADDRESS but it is not using PROXY SERVER to transmit data.
		public bool UseProxy
		{
			get	{ return useProxy; }
			set
			{
				Network.useProxy = value;
                serverSetting.mySetting.inputLanNet.UseProxy = value;
				useProxy = value;
			}
		}
        public bool SetUseProxy
        {
            set
            {
                Network.useProxy = value;
                //serverSetting.mySetting.inputLanNet.UseProxy = value;
                useProxy = value;
            }
        }
		public void AutoChangeServerType (bool authoritative)
		{	// Currently only LAN can use AUTHORITATIVE SERVER without much lag. For NET high PING cause response time issues.
			if (m_NetworkGameInfo.autoServerTypeSelect)
			{
				if (m_NetworkGameInfo.autoServerTypeSelect == authoritative)
				{
					m_NetworkGameInfo.serverType = ServerType.AuthoritativeServer;
				}
				else
				{
					m_NetworkGameInfo.serverType = ServerType.SemiAuthoritativeServer;
				} 
			}
		}

        [SerializeField, ReadOnly] bool connectingToMasterServerAs_HostTrue_JoinFalse;
        [SerializeField, ReadOnly] bool requestHostFailed;
        [SerializeField, ReadOnly] int indexOfMasterServerIP;
        [ReadOnly] public TestMasterServer testMasterServer;
        public List<string> banPlayerList;
		#endregion
		#endregion

	    #region Awake, Start, Singleton, etc.
	    void Awake()
	    {
            Singleton();
            serverSetting.masterServerSaveData.filePath = Application.persistentDataPath + "/" + serverSetting.masterServerSaveData.fileName;
            //Network.minimumAllocatableViewIDs = 100000;   //Keep this number low so there is less data transfers at start. (Note: Minimum Allocatable View IDs default is 100 if not specified.)
            MasterServer.updateRate = serverSetting.MasterServerUpdateRate;
	        NetworkMigrationManagerCheck();
            thisNetworkView = GetComponent<NetworkView>();
            resourceLoadPathListScript = GetComponent<ResourceLoadPathList>();
            m_NetworkGameInfo.spawnDefinitions = GetComponent<SpawnDefinitions>();

	        //GetComponent<NetworkView>().stateSynchronization = NetworkStateSynchronization.Off;                     // 0 
	        //GetComponent<NetworkView>().stateSynchronization = NetworkStateSynchronization.ReliableDeltaCompressed; // 1
	        //GetComponent<NetworkView>().stateSynchronization = NetworkStateSynchronization.Unreliable;              // 2

            // Default to start port so all testing will work
            serverSetting.mySetting.inputLanNet.port = serverSetting.portRange.StartPort;
	    }
        void Start()
        {
            Load_NetworkData(); // Need to define the File Path first
            StartCoroutine(FindNetworkExternalIP());
        }

	    void Singleton()
	    {
	        if (singleton == null)
	        {
	            singleton = this;
	            DontDestroyOnLoad(singleton);
	        }
	        else
	        {
	            Destroy(gameObject);
	        }
	    }
	    void NetworkMigrationManagerCheck()
	    {
	        if (GetComponent<NetworkMigrationManager>() != null)
	        {
	            m_NetworkMigrationManager = GetComponent<NetworkMigrationManager>();
	        }
	        else
	        {
	            useHostMigration = false;
	        }
	    }

	    void SetMasterServer_NATFacilitator(int i)
	    {
            if (localPorts.masterServerPort == 0)
            {
                localPorts.masterServerPort = 1; 
            }
	        // Need to make sure port is available.
	        if (islocalHostMasterServer)
	        {
	            MasterServer.ipAddress = "127.0.0.1";
                MasterServer.port = localPorts.masterServerPort;
	            Network.natFacilitatorIP = "127.0.0.1";
                Network.natFacilitatorPort = localPorts.masterServerPort + 1;
                localPorts.facilitatorServerPort = localPorts.masterServerPort + 1;
	            Network.proxyIP = "127.0.0.1";
                Network.proxyPort = localPorts.masterServerPort + 2;
                localPorts.proxyServerPort = localPorts.masterServerPort + 2;
	        }
	        else
	        {
	            MasterServer.ipAddress = masterNATProxyServers.masterServerIpAddresses[i];
				MasterServer.port = masterNATProxyServers.masterServerPorts[i];
				Network.natFacilitatorIP = masterNATProxyServers.natFacilitatorIpAddresses[i];
				Network.natFacilitatorPort = masterNATProxyServers.natFacilitatorPorts[i];
				Network.proxyIP = masterNATProxyServers.proxyIpAddresses[i];
				Network.proxyPort = masterNATProxyServers.proxyPorts[i];
	        }
	    }
	    void ChangeMasterServerAndRetry()
	    {
	        indexOfMasterServerIP++;
			if (indexOfMasterServerIP < masterNATProxyServers.masterServerIpAddresses.Count)
	        {
	            if (connectingToMasterServerAs_HostTrue_JoinFalse)
	            {
	                Debug.Log("Registering SERVER to MasterServer: " + indexOfMasterServerIP + " failed. Connecting to next...");
	                RegisterHost();
	            }
	            else
	            {
	                Debug.Log("Requesting HOSTLIST to MasterServer: " + indexOfMasterServerIP + " failed. Connecting to next...");
	                requestHostFailed = true;
	                TestingServerBeforeRefreshHostList();
	            }
	        }
	        else
	        {
                testMasterServer = TestMasterServer.allMasterServerUnavailable;
                indexOfMasterServerIP = 0;
                requestHostFailed = false;
	            RunAllOnAllMasterServerFailed();
	        }
	    }
	    #endregion

	    #region Host Server
	    void HostServerSetting(bool dedicatedServer = false)
	    {
	        // Set secure network
            if (serverSetting.mySetting.inputLanNet.InitializeSecurity)
	        {
	            Network.InitializeSecurity();
	        }
			Network.incomingPassword = serverSetting.mySetting.inputLanNet.Password;
            serverSetting.mySetting.inputLanNet.IsDedicatedServer = dedicatedServer;

			// Set Host Server IP & PORT Information
            serverSetting.mySetting.inputLanNet.ip = Network.player.ipAddress;
            // Adding external IP to host comment field
            if (Network.player.externalIP != "UNASSIGNED_SYSTEM_ADDRESS")
            {
                Debug.Log("Current External IP:" + Network.player.externalIP);
                serverSetting.mySetting.inputLanNet.externalIp = Network.player.externalIP;
            }
            else
            {
                // This is already set in 
                Debug.Log(Network.player.externalIP);
            }

			if(networkType == NetworkType.isLAN) {
                if (serverSetting.mySetting.inputLanNet.port < serverSetting.portRange.StartPort || serverSetting.mySetting.inputLanNet.port >= serverSetting.portRange.EndPort)
                {
                    serverSetting.mySetting.inputLanNet.port = serverSetting.portRange.StartPort; //Random.Range (serverSetting.portRange.StartPort, serverSetting.portRange.EndPort);
				}
			}
			if (networkType == NetworkType.isNET) {
                serverSetting.mySetting.inputLanNet.port = UnityEngine.Random.Range(serverSetting.portRange.StartPort, serverSetting.portRange.EndPort);
			}

            serverSetting.mySetting.myLanNet = serverSetting.mySetting.inputLanNet;
            serverSetting.mySetting.hostLanNet = serverSetting.mySetting.inputLanNet;
	    }

	    // Network Server
	    void RegisterHost()
	    {
	        // Setting initial MasterServer Location
	        SetMasterServer_NATFacilitator(indexOfMasterServerIP);
	        connectingToMasterServerAs_HostTrue_JoinFalse = true;

            if (serverSetting.mySetting.inputLanNet.TotalConnections > 0)
            {
                MasterServer.RegisterHost(serverSetting.mySetting.inputLanNet.GameType, serverSetting.mySetting.inputLanNet.GameName, serverSetting.mySetting.inputLanNet.EncodeCommentNET()); 
            }
	    }
	    public void StartNetworkServer(bool dedicatedServer = false)
	    {
            if (DoNotJoinCheck(serverSetting.mySetting.inputLanNet))
            {
                OnFailedToConnect(NetworkConnectionError.TooManyConnectedPlayers);
                return;
            }
            if (NetworkDiscoveryCustom.singleton.running)
            {
                NetworkDiscoveryCustom.singleton.StopBroadcastingListening();
            }
            if (useHostMigration)
            {
                serverSetting.mySetting.inputLanNet.migrationID = m_NetworkMigrationManager.CreateNewMigrationHostID();
                if (m_NetworkMigrationManager.migrationStage == MigrationStage.migrationOff)
                {
                    m_NetworkMigrationManager.migrationStage = MigrationStage.checkMigration;
                }
            }
            // Setting initial MasterServer Location
            SetMasterServer_NATFacilitator(indexOfMasterServerIP);
            connectingToMasterServerAs_HostTrue_JoinFalse = true;
            isLAN = false;
            AutoChangeServerType(IsLAN);
            networkType = NetworkType.isNET;
            peerTypeDesired = PeerTypeDesired.isServer;

            HostServerSetting(dedicatedServer);
            NetworkServerType();
	    }
	    void NetworkServerType()
	    {
			switch (serverSetting.forceUseNATProxy)
	        {
	            case ForceUseNATProxy.autoSelect:
	                #region AutoSelect Section
			        #if UNITY_STANDALONE //|| true  // !(UNITY_IOS || UNITY_ANDROID || UNITY_WP_8_1)
	                switch (Application.internetReachability)
	                {
	                    case NetworkReachability.ReachableViaLocalAreaNetwork:
	                        Debug.Log("ReachableViaLocalAreaNetwork");
	                        useWifi = true;
	                        UseNat = !Network.HavePublicAddress();
	                        //NatProxyOption(UseNat);
	                        #region Host have Public IP Address
			                UseProxy = false;   // This method also set (Network.useProxy = false;) so when running server with PublicIP Address it doesn't use the proxy server
                            if (!UseNat)
                            {
                                Debug.Log("Server Host have Public IP Address"); 
                            }
		                    #endregion
                            networkResponse = Network.InitializeServer(serverSetting.mySetting.inputLanNet.TotalConnections, serverSetting.mySetting.inputLanNet.port, UseNat);
	                        // It checks all the network interfaces for IPv4 public addresses and returns !!!TRUE!!! if one address is found
	                        break;
	                    case NetworkReachability.ReachableViaCarrierDataNetwork:
	                    default:
	                        // Note when using proxy server you cannot use NAT Punchthrough. Because NAT Punchthrough doesn't work well if at all.
	                        // Use proxy if all connection type fail to work. It is the best work around.
	                        Debug.Log("ReachableViaCarrierDataNetwork");
	                        Debug.Log("NotReachable or Undetermine");
	                        useWifi = false;
	                        NatProxyOption(false);  //UseNat=false; UseProxy=true
                            networkResponse = Network.InitializeServer(serverSetting.mySetting.inputLanNet.TotalConnections, serverSetting.mySetting.inputLanNet.port, UseNat);
	                        break;
	                }
	                #endif

	                #if !UNITY_STANDALONE //|| true
	                switch (Application.internetReachability)
	                {
	                    case NetworkReachability.ReachableViaLocalAreaNetwork:
	                        //UseNat = !Network.HavePublicAddress();  // NEED to detect if same network or different network since it is using WIFI (MOBILE always true for Public IP)
	                        Debug.Log("ReachableViaLocalAreaNetwork");
	                        useWifi = true;
	                        // Using Wifi Mobile will work!
	                        NatProxyOption(true);   // Only need proxy when connection fail to work! (But MOST or ALL LocalAreaNetwork are WIFI with NAT)
							networkResponse = Network.InitializeServer(serverSetting.mySetting.myLanNet.TotalConnections, serverSetting.mySetting.myLanNet.port, UseNat);
	                        // TestConnection need to be done here to ensure that this network can be seen by others. If not switch to proxy!
	                        break;
	                    case NetworkReachability.ReachableViaCarrierDataNetwork:
	                    default:
	                        // Note when using proxy server you cannot use NAT Punchthrough. Because NAT Punchthrough doesn't work well if at all.
	                        // Use proxy if all connection type fail to work. It is the best work around.
	                        Debug.Log("ReachableViaCarrierDataNetwork");
	                        Debug.Log("NotReachable or Undetermine");
	                        useWifi = false;
	                        NatProxyOption(false);  //useNat=false; useProxy=true
							networkResponse = Network.InitializeServer(serverSetting.mySetting.myLanNet.TotalConnections, serverSetting.mySetting.myLanNet.port, UseNat);
	                        break;
	                }
	                #endif
		            #endregion
	                break;
	            case ForceUseNATProxy.forceUseNAT:
	                #region ForceUseNAT Section
	                // Using Proxy When all else fail!
	                Debug.Log("ForceUseNAT");
	                NatProxyOption(true);  //useNat=true; useProxy=false
                    networkResponse = Network.InitializeServer(serverSetting.mySetting.inputLanNet.TotalConnections, serverSetting.mySetting.inputLanNet.port, UseNat);
	                #endregion
	                break;
	            case ForceUseNATProxy.forceUseProxy:
	            default:
	                #region ForceUseProxy Section
	                // Using Proxy When all else fail!
	                Debug.Log("ForceUseProxy");
	                NatProxyOption(false);  //useNat=false; useProxy=true
                    networkResponse = Network.InitializeServer(serverSetting.mySetting.inputLanNet.TotalConnections, serverSetting.mySetting.inputLanNet.port, UseNat);
	                #endregion
	                break;
	        }
            OnFailedToConnect(networkResponse);
	    }
	    // LAN Server
	    public void StartLocalAreaNetworkServer(bool dedicatedServer = false)
	    {
            if (DoNotJoinCheck(serverSetting.mySetting.inputLanNet))
            {
                OnFailedToConnect(NetworkConnectionError.TooManyConnectedPlayers);
                return;
            }
            if (useHostMigration)
            {
                serverSetting.mySetting.inputLanNet.migrationID = m_NetworkMigrationManager.CreateNewMigrationHostID();
                if (m_NetworkMigrationManager.migrationStage == MigrationStage.migrationOff)
                {
                    m_NetworkMigrationManager.migrationStage = MigrationStage.checkMigration;
                }
            }

            isLAN = true;
            AutoChangeServerType(IsLAN);
            networkType = NetworkType.isLAN;
            peerTypeDesired = PeerTypeDesired.isServer;

            HostServerSetting(dedicatedServer);
            NetworkDiscoveryCustom.singleton.StartBroadcasting();
            networkResponse = Network.InitializeServer(serverSetting.mySetting.inputLanNet.TotalConnections, serverSetting.mySetting.inputLanNet.port, false);
            OnFailedToConnect(networkResponse);
	    }
	    #endregion

	    #region Client Connection
	    // DONT DELETE: Can check for fail server and iterate through them. But if press multiple time this method will fail (NOTE: switch to RefreshHostList for quick successive clicks.)
        public Coroutine waitTestingServerBeforeRefreshHostList;
        public void TestingServerBeforeRefreshHostList()
	    {
            waitTestingServerBeforeRefreshHostList = StartCoroutine(WaitTestingServerBeforeRefreshHostList());
	    }
        IEnumerator WaitTestingServerBeforeRefreshHostList()
        {
            if (testMasterServer != TestMasterServer.masterServerFound)
            {
                testMasterServer = TestMasterServer.testing;
                requestHostFailed = true;
                if (!Network.isServer)
                {
                    StartNetworkServer();
                }
                SetMasterServer_NATFacilitator(indexOfMasterServerIP);
                while (!Network.isServer)
                {
                    yield return null;
                }
                Debug.Log("Testing Master Server Availability");
                MasterServer.RegisterHost("Testing Master Server", "Testing...", "Testing...");
            }
            else
            {
                isLAN = false;
                networkType = NetworkType.isNET;
                previousNetworkType = NetworkType.isNET;

                RefreshHostList();
            }
            // To network disconnect at end of testing master server.
            peerTypeDesired = PeerTypeDesired.none;
        }

	    // DONT DELETE: RefreshHostList can be press quickly multiple time without issues but cannot iterate through failed servers.
	    void RefreshHostList()
	    {
            if (NetworkDiscoveryCustom.singleton.running)
            {
                NetworkDiscoveryCustom.singleton.StopBroadcastingListening(); 
            }

	        // Setting initial MasterServer Location
	        SetMasterServer_NATFacilitator(indexOfMasterServerIP);
	        connectingToMasterServerAs_HostTrue_JoinFalse = false;

	        MasterServer.ClearHostList();
	        //Debug.Log("Requesting host list [" + indexOfMasterServerIP + "]...");
            MasterServer.RequestHostList(serverSetting.mySetting.inputLanNet.GameType);
	    }
	    IEnumerator WaitToRequestHostList(bool falseToStopAutoRefreshHostList_Quit)
	    {
	        RunAllOnWaitToRefreshHostList_Start();

	        // Because request HostList failed you will have to wait until next frame to sent another request (>2 "yield return null" for it to work.)
	        yield return null;
            yield return null;
            yield return null;
            yield return null;
            yield return null;

            //RefreshHostList();
            requestHostFailed = false;

            if (serverSetting.sortingOption.autoRefreshHostListNET)
            {
                AutoRefreshHostListStart(falseToStopAutoRefreshHostList_Quit);
            }
            else
            {
                RefreshHostList();
            }

	        RunAllOnWaitToRefreshHostList_End();
	    }
	    // Join Network Server
	    public void JoinNetworkServer(LANNETData lanNetData)
	    {
            if(DoNotJoinCheck(lanNetData))
            {
                OnFailedToConnect(NetworkConnectionError.TooManyConnectedPlayers);
                return;
            }
            if (NetworkDiscoveryCustom.singleton.running)
            {
                NetworkDiscoveryCustom.singleton.StopBroadcastingListening();
            }
	        isLAN = false;
			if (useHostMigration) {
				if(m_NetworkMigrationManager.migrationStage == MigrationStage.migrationOff)
				{
					m_NetworkMigrationManager.migrationStage = MigrationStage.checkMigration;
				}
			}
			AutoChangeServerType(IsLAN);
	        networkType = NetworkType.isNET;
			peerTypeDesired = PeerTypeDesired.isClient;

	        NatProxyFalseForClientAndHostWithPublicIP();

            // Save Password
            string tempPassword = serverSetting.mySetting.inputLanNet.Password;
            bool tempIsObserver = serverSetting.mySetting.inputLanNet.IsObserver;
            serverSetting.mySetting.myLanNet = serverSetting.mySetting.inputLanNet;

            // Get proxy info from string is NOW automatic
            if (lanNetData.UseProxy)
            {
                // IMPORTANT PROXY HAVE TO BE FALSE TO WORK FOR CLIENTs!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! (Also this is use for PUBLIC IP ADDRESS)
                Network.Connect(lanNetData.proxyIp, lanNetData.proxyPort, serverSetting.mySetting.inputLanNet.Password);
            }
            else
            {
                // If we are using regular Public IP or NAT Punchthrough
                Network.Connect(hostList[lanNetData.hostDataIntNET], serverSetting.mySetting.inputLanNet.Password);
            }
            serverSetting.mySetting.inputLanNet = lanNetData;  //Note: This also set the game scene as well. But for safety setting game build index earlier is safer.
            serverSetting.mySetting.hostLanNet = lanNetData;
            serverSetting.mySetting.inputLanNet.Password = tempPassword;
            serverSetting.mySetting.inputLanNet.IsObserver = tempIsObserver;
            m_NetworkGameInfo.stateSynchronization = (NetworkSynchronization)lanNetData.NetworkStateSynchronizationInt;
	    }
	    // Join LAN Server
        public void Join_LAN_Server(LANNETData lanNetData)
	    {
            if (DoNotJoinCheck(lanNetData))
            {
                OnFailedToConnect(NetworkConnectionError.TooManyConnectedPlayers);
                return;
            }
            if (NetworkDiscoveryCustom.singleton.running)
            {
                NetworkDiscoveryCustom.singleton.StopBroadcastingListening();
            }
	        isLAN = true;
			if (useHostMigration) {
				if(m_NetworkMigrationManager.migrationStage == MigrationStage.migrationOff)
				{
					m_NetworkMigrationManager.migrationStage = MigrationStage.checkMigration;
				}
			}
			AutoChangeServerType(IsLAN);
	        networkType = NetworkType.isLAN;
			peerTypeDesired = PeerTypeDesired.isClient;

            // Save Password
            string tempPassword = serverSetting.mySetting.inputLanNet.Password;
            bool tempIsObserver = serverSetting.mySetting.inputLanNet.IsObserver;
            serverSetting.mySetting.myLanNet = serverSetting.mySetting.inputLanNet;

            Network.Connect(lanNetData.ip, lanNetData.port, serverSetting.mySetting.inputLanNet.Password);

            serverSetting.mySetting.inputLanNet = lanNetData;  //Note: This also set the game scene as well. But for safety setting game build index earlier is safer.
            serverSetting.mySetting.hostLanNet = lanNetData;
            serverSetting.mySetting.inputLanNet.Password = tempPassword;
            serverSetting.mySetting.inputLanNet.IsObserver = tempIsObserver;
            m_NetworkGameInfo.stateSynchronization = (NetworkSynchronization)lanNetData.NetworkStateSynchronizationInt;
	    }
        
        public bool DoNotJoinCheck(LANNETData lanNetData)
        {
            if (lanNetData.ConnectedPlayers >= lanNetData.PlayerLimit && !serverSetting.mySetting.inputLanNet.IsObserver)
            {
                OnFailedToConnect(NetworkConnectionError.TooManyConnectedPlayers);
                Debug.LogError("TooManyConnectedPlayers");
                return true;
            }
            if (lanNetData.ConnectedObservers >= lanNetData.ObserverLimit && serverSetting.mySetting.inputLanNet.IsObserver)
            {
                OnFailedToConnect(NetworkConnectionError.TooManyConnectedPlayers);
                Debug.LogError("TooManyConnectedObservers");
                return true;
            }
            return false;
        }
        public bool ServerKickPlayerOutCheck(LANNETData lanNetData, NetworkPlayer player)
        {
            // NET should never have observers! Only LAN should have observers
            if (lanNetData.ConnectedPlayers >= lanNetData.PlayerLimit && !serverSetting.mySetting.inputLanNet.IsObserver)
            {
                Network.CloseConnection(player, true);
                return true;
            }
            if (lanNetData.ConnectedObservers >= lanNetData.ObserverLimit && serverSetting.mySetting.inputLanNet.IsObserver)
            {
                Network.CloseConnection(player, true);
                return true;
            }
            return false;
        }

        /// <summary>
        /// Banned player from reconnecting to host
        /// </summary>
        /// <param name="target">target to ban</param>
        /// <param name="sendDisconnectionNotification"></param>
        public static void BannedPlayer(NetworkPlayer target, bool sendDisconnectionNotification)
        {
            MasterServerNetworkManager.singleton.banPlayerList.Add(target.externalIP);
            //Network.CloseConnection(target, sendDisconnectionNotification);
            MasterServerNetworkManager.singleton.StartCoroutine(MasterServerNetworkManager.singleton.WaitBeforeBanPlayer(target, sendDisconnectionNotification));
        }
        public static void CheckForBannedPlayers(NetworkPlayer target)
        {
            for (int i = 0; i < MasterServerNetworkManager.singleton.banPlayerList.Count; i++)
            {
                if (target.externalIP == MasterServerNetworkManager.singleton.banPlayerList[i])
                {
                    MasterServerNetworkManager.singleton.StartCoroutine(MasterServerNetworkManager.singleton.WaitBeforeBanPlayer(target, true));
                }
            }
        }
        IEnumerator WaitBeforeBanPlayer(NetworkPlayer target, bool sendDisconnectionNotification)
        {
            thisNetworkView.RPC("NoticeToClientBeforeBanning", target);
            yield return StartCoroutine(CoroutineUtilities.WaitForRealTime(1)); // Time to ban player 1 sec.
            if (target.externalIP != null)
            {
                Network.CloseConnection(target, sendDisconnectionNotification); 
            }
        }
        [RPC] void NoticeToClientBeforeBanning()
        {
            RunAll_OnFailedToConnect(NetworkConnectionError.ConnectionBanned);
            UnregisterHostOrDisconnectClient_RefreshHostList();
        }
        #endregion

        #region Spawn & Player Setup
        GameObject clone;
        #region NetSpawn
        public GameObject NetSpawnPlayer(int index, Vector3 position = default(Vector3), Quaternion rotation = default(Quaternion), int group = 0)
	    {
	        // Create server playerToSentTo from index in list
	        return NetSpawnPlayer(resourceLoadPathListScript.resourcesLoadList[0].filePathList[index].LoadAsGameObject, position, rotation, group, index) as GameObject;
	    }
        public GameObject NetSpawnPlayer(UnityEngine.Object prefab, Vector3 position = default(Vector3), Quaternion rotation = default(Quaternion), int group = 0, int index = -1)
	    {
            if (index >= 0)
            {
                clone = Network.Instantiate(resourceLoadPathListScript.resourcesLoadList[0].filePathList[index].LoadAsGameObject, position, rotation, group) as GameObject;
            }
            else
            {
                clone = Network.Instantiate(prefab, position, rotation, group) as GameObject;
            }
            clone.GetComponent<NetworkView>().RPC("AddPlayerObjectToList", RPCMode.AllBuffered, serverSetting.mySetting.inputLanNet.IsObserver);
	        return clone;
	    }

	    public GameObject NetSpawnNPC(GameObject prefab, Vector3 position = default(Vector3), Quaternion rotation = default(Quaternion), int group = 0)
	    {
	        clone = Network.Instantiate(prefab, position, rotation, group) as GameObject;
			if (!MasterServerObjectList_Other.singleton.poolerOn) {
                clone.GetComponent<NetworkView>().RPC("AddNPCObjectToList", RPCMode.AllBuffered);
			}
	        // Probably can be added to SyncData where OnNetworkInstinate add object to list automatically (Note: RemovePlayerObject need to be modified in this case since netPlayer is not set try using GetInstanceID()) (This method might not work)
	        return clone;
	    }
	    #endregion

        #region New Improve NetSpawn
        NetworkViewID viewID;
        string gameObjectName;
        #region Player
        #region Network Spawn Player Overload
        public GameObject NetworkSpawnPlayer(RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayer_Index(                     viewID, serverSetting.mySetting.inputLanNet.IsObserver, m_NetworkGameInfo.playerPrefabIndex, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayer_Index", mode, viewID, serverSetting.mySetting.inputLanNet.IsObserver, m_NetworkGameInfo.playerPrefabIndex);
            return clone;
        }
        public GameObject NetworkSpawnPlayer(Vector3 position, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayerPos3D_Index(                     viewID, serverSetting.mySetting.inputLanNet.IsObserver, m_NetworkGameInfo.playerPrefabIndex, position, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayerPos3D_Index", mode, viewID, serverSetting.mySetting.inputLanNet.IsObserver, m_NetworkGameInfo.playerPrefabIndex, position);
            return clone;
        }
        public GameObject NetworkSpawnPlayer(Vector3 position, Quaternion rotation, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayerPosRot3D_Index(                     viewID, serverSetting.mySetting.inputLanNet.IsObserver, m_NetworkGameInfo.playerPrefabIndex, position, rotation.eulerAngles, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayerPosRot3D_Index", mode, viewID, serverSetting.mySetting.inputLanNet.IsObserver, m_NetworkGameInfo.playerPrefabIndex, position, rotation.eulerAngles);
            return clone;
        }

        public GameObject NetworkSpawnPlayer(GameObject prefab, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayer_Index(                     viewID, serverSetting.mySetting.inputLanNet.IsObserver, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayer_Index", mode, viewID, serverSetting.mySetting.inputLanNet.IsObserver, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab));
            return clone;
        }
        public GameObject NetworkSpawnPlayer(GameObject prefab, Vector3 position, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayerPos3D_Index(                     viewID, serverSetting.mySetting.inputLanNet.IsObserver, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayerPos3D_Index", mode, viewID, serverSetting.mySetting.inputLanNet.IsObserver, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position);
            return clone;
        }
        public GameObject NetworkSpawnPlayer(GameObject prefab, Vector3 position, Quaternion rotation, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayerPosRot3D_Index(                     viewID, serverSetting.mySetting.inputLanNet.IsObserver, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayerPosRot3D_Index", mode, viewID, serverSetting.mySetting.inputLanNet.IsObserver, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles);
            return clone;
        }

        public GameObject NetworkSpawnPlayer(int layer, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayer_Layer_Index(                     viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, m_NetworkGameInfo.playerPrefabIndex, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayer_Layer_Index", mode, viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, m_NetworkGameInfo.playerPrefabIndex);
            return clone;
        }
        public GameObject NetworkSpawnPlayer(int layer, Vector3 position, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayerPos3D_Layer_Index(                     viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, m_NetworkGameInfo.playerPrefabIndex, position, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayerPos3D_Layer_Index", mode, viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, m_NetworkGameInfo.playerPrefabIndex, position);
            return clone;
        }
        public GameObject NetworkSpawnPlayer(int layer, Vector3 position, Quaternion rotation, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayerPosRot3D_Layer_Index(                     viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, m_NetworkGameInfo.playerPrefabIndex, position, rotation.eulerAngles, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayerPosRot3D_Layer_Index", mode, viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, m_NetworkGameInfo.playerPrefabIndex, position, rotation.eulerAngles);
            return clone;
        }

        public GameObject NetworkSpawnPlayer(int layer, GameObject prefab, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayer_Layer_Index(                     viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayer_Layer_Index", mode, viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab));
            return clone;
        }
        public GameObject NetworkSpawnPlayer(int layer, GameObject prefab, Vector3 position, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayerPos3D_Layer_Index(                     viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayerPos3D_Layer_Index", mode, viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position);
            return clone;
        }
        public GameObject NetworkSpawnPlayer(int layer, GameObject prefab, Vector3 position, Quaternion rotation, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayerPosRot3D_Layer_Index(                     viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayerPosRot3D_Layer_Index", mode, viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles);
            return clone;
        }

        #region More Data transfer required if more than 4 charaters for prefab name.
        //public GameObject NetworkSpawnPlayer(GameObject prefab, RPCMode mode = RPCMode.OthersBuffered)
        //{
        //    viewID = Network.AllocateViewID();
        //    clone = NetworkSpawnPlayer_GameObject(viewID, serverSetting.mySetting.inputLanNet.IsObserver, StringExtension.RemoveFromEndAll(prefab.name, "(Clone)"), default(NetworkMessageInfo));
        //    thisNetworkView.RPC("NetworkSpawnPlayer_GameObject", mode, viewID, serverSetting.mySetting.inputLanNet.IsObserver, StringExtension.RemoveFromEndAll(prefab.name, "(Clone)"));
        //    return clone;
        //}
        //public GameObject NetworkSpawnPlayer(GameObject prefab, Vector3 position, RPCMode mode = RPCMode.OthersBuffered)
        //{
        //    viewID = Network.AllocateViewID();
        //    clone = NetworkSpawnPlayerPos3D_GameObject(viewID, serverSetting.mySetting.inputLanNet.IsObserver, StringExtension.RemoveFromEndAll(prefab.name, "(Clone)"), position, default(NetworkMessageInfo));
        //    thisNetworkView.RPC("NetworkSpawnPlayerPos3D_GameObject", mode, viewID, serverSetting.mySetting.inputLanNet.IsObserver, StringExtension.RemoveFromEndAll(prefab.name, "(Clone)"), position);
        //    return clone;
        //}
        //public GameObject NetworkSpawnPlayer(GameObject prefab, Vector3 position, Quaternion rotation, RPCMode mode = RPCMode.OthersBuffered)
        //{
        //    viewID = Network.AllocateViewID();
        //    clone = NetworkSpawnPlayerPosRot3D_GameObject(viewID, serverSetting.mySetting.inputLanNet.IsObserver, StringExtension.RemoveFromEndAll(prefab.name, "(Clone)"), position, rotation.eulerAngles, default(NetworkMessageInfo));
        //    thisNetworkView.RPC("NetworkSpawnPlayerPosRot3D_GameObject", mode, viewID, serverSetting.mySetting.inputLanNet.IsObserver, StringExtension.RemoveFromEndAll(prefab.name, "(Clone)"), position, rotation.eulerAngles);
        //    return clone;
        //} 
        #endregion

        public GameObject NetworkSpawnPlayer(NetworkPlayer sendTo)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayer_Index(viewID, serverSetting.mySetting.inputLanNet.IsObserver, m_NetworkGameInfo.playerPrefabIndex, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayer_Index", sendTo, viewID, serverSetting.mySetting.inputLanNet.IsObserver, m_NetworkGameInfo.playerPrefabIndex);
            return clone;
        }
        public GameObject NetworkSpawnPlayer(NetworkPlayer sendTo, Vector3 position)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayerPos3D_Index(viewID, serverSetting.mySetting.inputLanNet.IsObserver, m_NetworkGameInfo.playerPrefabIndex, position, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayerPos3D_Index", sendTo, viewID, serverSetting.mySetting.inputLanNet.IsObserver, m_NetworkGameInfo.playerPrefabIndex, position);
            return clone;
        }
        public GameObject NetworkSpawnPlayer(NetworkPlayer sendTo, Vector3 position, Quaternion rotation)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayerPosRot3D_Index(viewID, serverSetting.mySetting.inputLanNet.IsObserver, m_NetworkGameInfo.playerPrefabIndex, position, rotation.eulerAngles, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayerPosRot3D_Index", sendTo, viewID, serverSetting.mySetting.inputLanNet.IsObserver, m_NetworkGameInfo.playerPrefabIndex, position, rotation.eulerAngles);
            return clone;
        }

        public GameObject NetworkSpawnPlayer(NetworkPlayer sendTo, GameObject prefab)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayer_Index(viewID, serverSetting.mySetting.inputLanNet.IsObserver, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayer_Index", sendTo, viewID, serverSetting.mySetting.inputLanNet.IsObserver, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab));
            return clone;
        }
        public GameObject NetworkSpawnPlayer(NetworkPlayer sendTo, GameObject prefab, Vector3 position)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayerPos3D_Index(viewID, serverSetting.mySetting.inputLanNet.IsObserver, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayerPos3D_Index", sendTo, viewID, serverSetting.mySetting.inputLanNet.IsObserver, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position);
            return clone;
        }
        public GameObject NetworkSpawnPlayer(NetworkPlayer sendTo, GameObject prefab, Vector3 position, Quaternion rotation)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayerPosRot3D_Index(viewID, serverSetting.mySetting.inputLanNet.IsObserver, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayerPosRot3D_Index", sendTo, viewID, serverSetting.mySetting.inputLanNet.IsObserver, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles);
            return clone;
        }

        public GameObject NetworkSpawnPlayer(NetworkPlayer sendTo, int layer)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayer_Layer_Index(viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, m_NetworkGameInfo.playerPrefabIndex, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayer_Layer_Index", sendTo, viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, m_NetworkGameInfo.playerPrefabIndex);
            return clone;
        }
        public GameObject NetworkSpawnPlayer(NetworkPlayer sendTo, int layer, Vector3 position)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayerPos3D_Layer_Index(viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, m_NetworkGameInfo.playerPrefabIndex, position, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayerPos3D_Layer_Index", sendTo, viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, m_NetworkGameInfo.playerPrefabIndex, position);
            return clone;
        }
        public GameObject NetworkSpawnPlayer(NetworkPlayer sendTo, int layer, Vector3 position, Quaternion rotation)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayerPosRot3D_Layer_Index(viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, m_NetworkGameInfo.playerPrefabIndex, position, rotation.eulerAngles, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayerPosRot3D_Layer_Index", sendTo, viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, m_NetworkGameInfo.playerPrefabIndex, position, rotation.eulerAngles);
            return clone;
        }

        public GameObject NetworkSpawnPlayer(NetworkPlayer sendTo, int layer, GameObject prefab)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayer_Layer_Index(viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayer_Layer_Index", sendTo, viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab));
            return clone;
        }
        public GameObject NetworkSpawnPlayer(NetworkPlayer sendTo, int layer, GameObject prefab, Vector3 position)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayerPos3D_Layer_Index(viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayerPos3D_Layer_Index", sendTo, viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position);
            return clone;
        }
        public GameObject NetworkSpawnPlayer(NetworkPlayer sendTo, int layer, GameObject prefab, Vector3 position, Quaternion rotation)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnPlayerPosRot3D_Layer_Index(viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnPlayerPosRot3D_Layer_Index", sendTo, viewID, serverSetting.mySetting.inputLanNet.IsObserver, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles);
            return clone;
        }

        #region More Data transfer required if more than 4 charaters for prefab name.
        //public GameObject NetworkSpawnPlayer(NetworkPlayer sendTo, GameObject prefab, Vector3 position)
        //{
        //    viewID = Network.AllocateViewID();
        //    clone = NetworkSpawnPlayerPos3D_GameObject(viewID, serverSetting.mySetting.inputLanNet.IsObserver, StringExtension.RemoveFromEndAll(prefab.name, "(Clone)"), position, default(NetworkMessageInfo));
        //    thisNetworkView.RPC("NetworkSpawnPlayerPos3D_GameObject", sendTo, viewID, serverSetting.mySetting.inputLanNet.IsObserver, StringExtension.RemoveFromEndAll(prefab.name, "(Clone)"), position);
        //    return clone;
        //}
        //public GameObject NetworkSpawnPlayer(NetworkPlayer sendTo, GameObject prefab, Vector3 position, Quaternion rotation)
        //{
        //    viewID = Network.AllocateViewID();
        //    clone = NetworkSpawnPlayerPosRot3D_GameObject(viewID, serverSetting.mySetting.inputLanNet.IsObserver, StringExtension.RemoveFromEndAll(prefab.name, "(Clone)"), position, rotation.eulerAngles, default(NetworkMessageInfo));
        //    thisNetworkView.RPC("NetworkSpawnPlayerPosRot3D_GameObject", sendTo, viewID, serverSetting.mySetting.inputLanNet.IsObserver, StringExtension.RemoveFromEndAll(prefab.name, "(Clone)"), position, rotation.eulerAngles);
        //    return clone;
        //}
        #endregion
        #endregion

        #region Player Spawn RPCs
        // Typical Spawning Sync Data
        [RPC] GameObject NetworkSpawnPlayer_Index             (NetworkViewID id, bool observer, int index, NetworkMessageInfo info)
        {
            return NetworkSpawnPlayerPosRot3D_Index(id, observer, index, Vector3.zero, Vector3.zero, info);
        }
        [RPC] GameObject NetworkSpawnPlayerPos3D_Index        (NetworkViewID id, bool observer, int index, Vector3 pos, NetworkMessageInfo info)
        {
            return NetworkSpawnPlayerPosRot3D_Index(id, observer, index, pos, Vector3.zero, info);
        }
        [RPC] GameObject NetworkSpawnPlayerPosRot3D_Index     (NetworkViewID id, bool observer, int index, Vector3 pos, Vector3 rotEuler, NetworkMessageInfo info)
        {
            //if (info.sender.ToString() != "0" && Network.isClient) return null;
            if (index >= 0)
            {
                if (pos == Vector3.zero && rotEuler == Vector3.zero)
	            {
                    clone = Instantiate(resourceLoadPathListScript.resourcesLoadList[0].filePathList[index].LoadAsGameObject) as GameObject;
	            } else {
                    clone = Instantiate(resourceLoadPathListScript.resourcesLoadList[0].filePathList[index].LoadAsGameObject, pos, Quaternion.Euler(rotEuler)) as GameObject;
                }
                NetworkView nView;
                nView = clone.GetComponent<NetworkView>();
                nView.viewID = id;
            }
            else
            {
                return null;
            }
            clone.GetComponent<SyncData>().AddPlayerObjectToList2(observer, id.owner /*info*/);
            return clone;
        }

        #region More Data transfer required if more than 4 charaters for prefab name.
        //[RPC] GameObject NetworkSpawnPlayer_GameObject        (NetworkViewID id, bool observer, string objectName, NetworkMessageInfo info)
        //{
        //    return NetworkSpawnPlayerPosRot3D_GameObject(id, observer, objectName, Vector3.zero, Vector3.zero, info);
        //}
        //[RPC] GameObject NetworkSpawnPlayerPos3D_GameObject   (NetworkViewID id, bool observer, string objectName, Vector3 pos, NetworkMessageInfo info)
        //{
        //    return NetworkSpawnPlayerPosRot3D_GameObject(id, observer, objectName, pos, Vector3.zero, info);
        //}
        //[RPC] GameObject NetworkSpawnPlayerPosRot3D_GameObject(NetworkViewID id, bool observer, string objectName, Vector3 pos, Vector3 rotEuler, NetworkMessageInfo info)
        //{
        //    //if (info.sender.ToString() != "0" && Network.isClient) return null;
        //    clone = null;
        //    clone = MasterServerNetworkManager.resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectFromResource(objectName);
        //    if (clone != null)
        //    {
        //        if (pos == Vector3.zero && rotEuler == Quaternion.identity.eulerAngles)
        //        {
        //            clone = Instantiate(clone) as GameObject; 
        //        } else {
        //            clone = Instantiate(clone, pos, Quaternion.Euler(rotEuler)) as GameObject; 
        //        }
        //        NetworkView nView;
        //        nView = clone.GetComponent<NetworkView>();
        //        nView.viewID = id;
        //    }
        //    else
        //    {
        //        return null;
        //    }
        //    clone.GetComponent<SyncData>().AddPlayerObjectToList2(observer, id.owner /*info*/);
        //    return clone;
        //}
        #endregion
        
        // Send Layer Data
        [RPC] GameObject NetworkSpawnPlayer_Layer_Index             (NetworkViewID id, bool observer, int layer, int index, NetworkMessageInfo info)
        {
            return NetworkSpawnPlayerPosRot3D_Layer_Index(id, observer, layer, index, Vector3.zero, Vector3.zero, info);
        }
        [RPC] GameObject NetworkSpawnPlayerPos3D_Layer_Index        (NetworkViewID id, bool observer, int layer, int index, Vector3 pos, NetworkMessageInfo info)
        {
            return NetworkSpawnPlayerPosRot3D_Layer_Index(id, observer, layer, index, pos, Vector3.zero, info);
        }
        [RPC] GameObject NetworkSpawnPlayerPosRot3D_Layer_Index     (NetworkViewID id, bool observer, int layer, int index, Vector3 pos, Vector3 rotEuler, NetworkMessageInfo info)
        {
            clone = NetworkSpawnPlayerPosRot3D_Index(id, observer, index, pos, rotEuler, info);
            clone.layer = layer;
            clone.GetComponent<SyncData>().layer = layer;
            return clone;
        }

        #region More Data transfer required if more than 4 charaters for prefab name.
        //[RPC] GameObject NetworkSpawnPlayerPos3D_Layer_GameObject   (NetworkViewID id, bool observer, string objectName, int layer, Vector3 pos, NetworkMessageInfo info)
        //{
        //    clone = null;
        //    clone = MasterServerNetworkManager.resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectFromResource(objectName);
        //    if (clone != null)
        //    {
        //        clone = Instantiate(clone, pos, Quaternion.identity) as GameObject/* as GameObject*/;
        //        NetworkView nView;
        //        nView = clone.GetComponent<NetworkView>();
        //        nView.viewID = id;
        //    }
        //    else
        //    {
        //        return null;
        //    }
        //    clone.GetComponent<SyncData>().AddPlayerObjectToList2(observer, id.owner /*info*/);
        //    return clone;
        //}
        //[RPC] GameObject NetworkSpawnPlayerPosRot3D_Layer_GameObject(NetworkViewID id, bool observer, string objectName, int layer, Vector3 pos, Vector3 rotEuler, NetworkMessageInfo info)
        //{
        //    clone = null;
        //    clone = MasterServerNetworkManager.resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectFromResource(objectName);
        //    if (clone != null)
        //    {
        //        clone = Instantiate(clone, pos, Quaternion.Euler(rotEuler)) as GameObject/* as GameObject*/;
        //        NetworkView nView;
        //        nView = clone.GetComponent<NetworkView>();
        //        nView.viewID = id;
        //    }
        //    else
        //    {
        //        return null;
        //    }
        //    clone.GetComponent<SyncData>().AddPlayerObjectToList2(observer, id.owner /*info*/);
        //    return clone;
        //}
        #endregion
        #endregion
        #endregion

        #region NPC
        #region NPC Overload
        public GameObject NetworkSpawnNPC(GameObject prefab, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPC_Index(viewID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPC_Index", mode, viewID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab));
            return clone;
        }
        public GameObject NetworkSpawnNPC(GameObject prefab, Vector3 position, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPCPos3D_Index(viewID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPCPos3D_Index", mode, viewID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position);
            return clone;
        }
        public GameObject NetworkSpawnNPC(GameObject prefab, Vector3 position, Quaternion rotation, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPCPosRot3D_Index(viewID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPCPosRot3D_Index", mode, viewID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles);
            return clone;
        }

        public GameObject NetworkSpawnNPC(GameObject prefab, NetworkViewID poolerID, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPCPoolID_Index(viewID, poolerID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPCPoolID_Index", mode, viewID, poolerID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab));
            return clone;
        }
        public GameObject NetworkSpawnNPC(GameObject prefab, NetworkViewID poolerID, Vector3 position, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPCPos3DPoolID_Index(viewID, poolerID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPCPos3DPoolID_Index", mode, viewID, poolerID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position);
            return clone;
        }
        public GameObject NetworkSpawnNPC(GameObject prefab, NetworkViewID poolerID, Vector3 position, Quaternion rotation, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPCPosRot3DPoolID_Index(viewID, poolerID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPCPosRot3DPoolID_Index", mode, viewID, poolerID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles);
            return clone;
        }

        public GameObject NetworkSpawnNPC(int layer, GameObject prefab, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPC_Layer_Index(viewID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPC_Layer_Index", mode, viewID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab));
            return clone;
        }
        public GameObject NetworkSpawnNPC(int layer, GameObject prefab, Vector3 position, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPCPos3D_Layer_Index(viewID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPCPos3D_Layer_Index", mode, viewID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position);
            return clone;
        }
        public GameObject NetworkSpawnNPC(int layer, GameObject prefab, Vector3 position, Quaternion rotation, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPCPosRot3D_Layer_Index(viewID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPCPosRot3D_Layer_Index", mode, viewID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles);
            return clone;
        }

        public GameObject NetworkSpawnNPC(int layer, GameObject prefab, NetworkViewID poolerID, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPCPoolID_Layer_Index(viewID, poolerID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPCPoolID_Layer_Index", mode, viewID, poolerID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab));
            return clone;
        }
        public GameObject NetworkSpawnNPC(int layer, GameObject prefab, NetworkViewID poolerID, Vector3 position, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPCPos3DPoolID_Layer_Index(viewID, poolerID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPCPos3DPoolID_Layer_Index", mode, viewID, poolerID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position);
            return clone;
        }
        public GameObject NetworkSpawnNPC(int layer, GameObject prefab, NetworkViewID poolerID, Vector3 position, Quaternion rotation, RPCMode mode = RPCMode.OthersBuffered)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPCPosRot3DPoolID_Layer_Index(viewID, poolerID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPCPosRot3DPoolID_Layer_Index", mode, viewID, poolerID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles);
            return clone;
        } 

        ////////////////////////////////////

        public GameObject NetworkSpawnNPC(NetworkPlayer sendTo, GameObject prefab)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPC_Index(viewID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPC_Index", sendTo, viewID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab));
            return clone;
        }
        public GameObject NetworkSpawnNPC(NetworkPlayer sendTo, GameObject prefab, Vector3 position)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPCPos3D_Index(viewID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPCPos3D_Index", sendTo, viewID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position);
            return clone;
        }
        public GameObject NetworkSpawnNPC(NetworkPlayer sendTo, GameObject prefab, Vector3 position, Quaternion rotation)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPCPosRot3D_Index(viewID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPCPosRot3D_Index", sendTo, viewID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles);
            return clone;
        }

        public GameObject NetworkSpawnNPC(NetworkPlayer sendTo, GameObject prefab, NetworkViewID poolerID)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPCPoolID_Index(viewID, poolerID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPCPoolID_Index", sendTo, viewID, poolerID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab));
            return clone;
        }
        public GameObject NetworkSpawnNPC(NetworkPlayer sendTo, GameObject prefab, NetworkViewID poolerID, Vector3 position)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPCPos3DPoolID_Index(viewID, poolerID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPCPos3DPoolID_Index", sendTo, viewID, poolerID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position);
            return clone;
        }
        public GameObject NetworkSpawnNPC(NetworkPlayer sendTo, GameObject prefab, NetworkViewID poolerID, Vector3 position, Quaternion rotation)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPCPosRot3DPoolID_Index(viewID, poolerID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPCPosRot3DPoolID_Index", sendTo, viewID, poolerID, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles);
            return clone;
        }

        public GameObject NetworkSpawnNPC(NetworkPlayer sendTo, int layer, GameObject prefab)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPC_Layer_Index(viewID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPC_Layer_Index", sendTo, viewID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab));
            return clone;
        }
        public GameObject NetworkSpawnNPC(NetworkPlayer sendTo, int layer, GameObject prefab, Vector3 position)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPCPos3D_Layer_Index(viewID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPCPos3D_Layer_Index", sendTo, viewID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position);
            return clone;
        }
        public GameObject NetworkSpawnNPC(NetworkPlayer sendTo, int layer, GameObject prefab, Vector3 position, Quaternion rotation)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPCPosRot3D_Layer_Index(viewID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPCPosRot3D_Layer_Index", sendTo, viewID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles);
            return clone;
        }

        public GameObject NetworkSpawnNPC(NetworkPlayer sendTo, int layer, GameObject prefab, NetworkViewID poolerID)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPCPoolID_Layer_Index(viewID, poolerID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPCPoolID_Layer_Index", sendTo, viewID, poolerID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab));
            return clone;
        }
        public GameObject NetworkSpawnNPC(NetworkPlayer sendTo, int layer, GameObject prefab, NetworkViewID poolerID, Vector3 position)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPCPos3DPoolID_Layer_Index(viewID, poolerID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPCPos3DPoolID_Layer_Index", sendTo, viewID, poolerID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position);
            return clone;
        }
        public GameObject NetworkSpawnNPC(NetworkPlayer sendTo, int layer, GameObject prefab, NetworkViewID poolerID, Vector3 position, Quaternion rotation)
        {
            viewID = Network.AllocateViewID();
            clone = NetworkSpawnNPCPosRot3DPoolID_Layer_Index(viewID, poolerID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles, default(NetworkMessageInfo));
            thisNetworkView.RPC("NetworkSpawnNPCPosRot3DPoolID_Layer_Index", sendTo, viewID, poolerID, layer, resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectIndex(prefab), position, rotation.eulerAngles);
            return clone;
        } 
        #endregion

        #region NPC RPCs
        [RPC] GameObject NetworkSpawnNPC_Index(NetworkViewID id, int index, NetworkMessageInfo info)
        {
            return NetworkSpawnNPCPosRot3D_Index(id, index, Vector3.zero, Vector3.zero, info);
        }
        [RPC] GameObject NetworkSpawnNPCPos3D_Index(NetworkViewID id, int index, Vector3 pos, NetworkMessageInfo info)
        {
            return NetworkSpawnNPCPosRot3D_Index(id, index, pos, Vector3.zero, info);
        }
        [RPC] GameObject NetworkSpawnNPCPosRot3D_Index(NetworkViewID id, int index, Vector3 pos, Vector3 rotEuler, NetworkMessageInfo info)
        {
            return NetworkSpawnNPCPosRot3DPoolID_Index(id, MasterServerNetworkManager.singleton.thisNetworkView.viewID, index, pos, rotEuler, info);
        }

        [RPC] GameObject NetworkSpawnNPCPoolID_Index(NetworkViewID id, NetworkViewID poolerID, int index, NetworkMessageInfo info)
        {
            return NetworkSpawnNPCPosRot3DPoolID_Index(id, poolerID, index, Vector3.zero, Vector3.zero, info);
        }
        [RPC] GameObject NetworkSpawnNPCPos3DPoolID_Index(NetworkViewID id, NetworkViewID poolerID, int index, Vector3 pos, NetworkMessageInfo info)
        {
            return NetworkSpawnNPCPosRot3DPoolID_Index(id, poolerID, index, pos, Vector3.zero, info);
        }
        [RPC] GameObject NetworkSpawnNPCPosRot3DPoolID_Index(NetworkViewID id, NetworkViewID poolerID, int index, Vector3 pos, Vector3 rotEuler, NetworkMessageInfo info)
        {
            // Only SERVER can spawn NPCs
            //if (info.sender.ToString() != "0")
            //{
            //    MasterServerNetworkManager.BannedPlayer(info.sender, true);
            //    return null;
            //}
            clone = null;
            if (index >= 0)
            {
                if (pos == Vector3.zero && rotEuler == Vector3.zero)
                {
                    clone = Instantiate(resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectFromResource(index)) as GameObject;
                }
                else
                {
                    clone = Instantiate(resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectFromResource(index), pos, Quaternion.Euler(rotEuler)) as GameObject;
                }
                NetworkView nView;
                nView = clone.GetComponent<NetworkView>();
                nView.viewID = id;
            }
            else
            {
                return null;
            }
            if (!MasterServerObjectList_Other.singleton.poolerOn)
            {
                clone.GetComponent<SyncData>().AddNPCObjectToList2(info);
            }
            else
            {
                if (clone.GetComponent<SyncData>() != null)
                {
                    clone.GetComponent<SyncData>().AddToPool2(poolerID, info);  // i or -1 is fine
                }
                else
                {
                    Debug.Log("Add NetworkView to " + clone.name + "since it is a network object!");
                }
            }
            return clone;
        }

        [RPC] GameObject NetworkSpawnNPC_Layer_Index(NetworkViewID id, int layer, int index, NetworkMessageInfo info)
        {
            return NetworkSpawnNPCPosRot3D_Layer_Index(id, layer, index, Vector3.zero, Vector3.zero, info);
        }
        [RPC] GameObject NetworkSpawnNPCPos3D_Layer_Index(NetworkViewID id, int layer, int index, Vector3 pos, NetworkMessageInfo info)
        {
            return NetworkSpawnNPCPosRot3D_Layer_Index(id, layer, index, pos, Vector3.zero, info);
        }
        [RPC] GameObject NetworkSpawnNPCPosRot3D_Layer_Index(NetworkViewID id, int layer, int index, Vector3 pos, Vector3 rotEuler, NetworkMessageInfo info)
        {
            return NetworkSpawnNPCPosRot3DPoolID_Layer_Index(id, MasterServerNetworkManager.singleton.thisNetworkView.viewID, layer, index, pos, rotEuler, info);
        }

        [RPC] GameObject NetworkSpawnNPCPoolID_Layer_Index(NetworkViewID id, NetworkViewID poolerID, int layer, int index, NetworkMessageInfo info)
        {
            return NetworkSpawnNPCPosRot3DPoolID_Layer_Index(id, poolerID, layer, index, Vector3.zero, Vector3.zero, info);
        }
        [RPC] GameObject NetworkSpawnNPCPos3DPoolID_Layer_Index(NetworkViewID id, NetworkViewID poolerID, int layer, int index, Vector3 pos, NetworkMessageInfo info)
        {
            return NetworkSpawnNPCPosRot3DPoolID_Layer_Index(id, poolerID, layer, index, pos, Vector3.zero, info);
        }
        [RPC] GameObject NetworkSpawnNPCPosRot3DPoolID_Layer_Index(NetworkViewID id, NetworkViewID poolerID, int layer, int index, Vector3 pos, Vector3 rotEuler, NetworkMessageInfo info)
        {
            clone = NetworkSpawnNPCPosRot3DPoolID_Index(id, poolerID, index, pos, Vector3.zero, info);
            clone.layer = layer;
            clone.GetComponent<SyncData>().layer = layer;
            return clone;
        }

        #region More Data transfer required if more than 4 charaters for prefab name.
        //[RPC] GameObject NetworkSpawnNPC_GameObject        (NetworkViewID id, string objectName, NetworkMessageInfo info)
        //{
        //    return NetworkSpawnNPCPosRot3D_GameObject(id, objectName, Vector3.zero, Vector3.zero, info);
        //}
        //[RPC] GameObject NetworkSpawnNPCPos3D_GameObject   (NetworkViewID id, string objectName, Vector3 pos, NetworkMessageInfo info)
        //{
        //    return NetworkSpawnNPCPosRot3D_GameObject(id, objectName, pos, Vector3.zero, info);
        //}
        //[RPC] GameObject NetworkSpawnNPCPosRot3D_GameObject(NetworkViewID id, string objectName, Vector3 pos, Vector3 rotEuler, NetworkMessageInfo info)
        //{
        //    return NetworkSpawnNPCPosRot3DPoolID_GameObject(id, MasterServerNetworkManager.singleton.thisNetworkView.viewID, objectName, pos, rotEuler, info);
        //}
        //[RPC] GameObject NetworkSpawnNPCPoolID_GameObject        (NetworkViewID id, NetworkViewID poolerID, string objectName, NetworkMessageInfo info)
        //{
        //    return NetworkSpawnNPCPosRot3DPoolID_GameObject(id, poolerID, objectName, Vector3.zero, Vector3.zero, info);
        //}
        //[RPC] GameObject NetworkSpawnNPCPos3DPoolID_GameObject   (NetworkViewID id, NetworkViewID poolerID, string objectName, Vector3 pos, NetworkMessageInfo info)
        //{
        //    return NetworkSpawnNPCPosRot3DPoolID_GameObject(id, poolerID, objectName, pos, Vector3.zero, info);
        //}
        //[RPC] GameObject NetworkSpawnNPCPosRot3DPoolID_GameObject(NetworkViewID id, NetworkViewID poolerID, string objectName, Vector3 pos, Vector3 rotEuler, NetworkMessageInfo info)
        //{
        //    //if (info.sender.ToString() != "0" && Network.isClient) return null;
        //    // Only SERVER can spawn NPCs
        //    //if (info.sender.ToString() != "0")
        //    //{
        //    //    MasterServerNetworkManager.BannedPlayer(info.sender, true);
        //    //    return null;
        //    //}
        //    clone = null;
        //    clone = MasterServerNetworkManager.resourceLoadPathListScript.resourcesLoadList[0].ReturnGameObjectFromResource(objectName);
        //    if (clone != null)
        //    {
        //        if (pos == Vector3.zero && rotEuler == Vector3.zero)
        //        {
        //            clone = Instantiate(clone) as GameObject; 
        //        } else {
        //            clone = Instantiate(clone, pos, Quaternion.Euler(rotEuler)) as GameObject;
        //        }
        //        NetworkView nView;
        //        nView = clone.GetComponent<NetworkView>();
        //        nView.viewID = id;
        //    }
        //    else
        //    {
        //        return null;
        //    }
        //    if (!MasterServerObjectList_Other.singleton.poolerOn)
        //    {
        //        clone.GetComponent<SyncData>().AddNPCObjectToList2(info);
        //    }
        //    else
        //    {
        //        if (clone.GetComponent<SyncData>() != null)
        //        {
        //            clone.GetComponent<SyncData>().AddToPool2(poolerID, info);  // i or -1 is fine
        //        }
        //        else
        //        {
        //            Debug.Log("Add NetworkView to " + clone.name + "since it is a network object!");
        //        }
        //    }
        //    return clone;
        //}
        #endregion 
        #endregion
        #endregion
        #endregion

        #region Example Player Spawning
        // Note: SERVER is the only one that can spawn players/enemies. CLIENTS calls RPC to spawn.
        public GameObject SpawnPlayer(int index, int group = 0)
        {
            // Create server playerToSentTo from index in list
            clone = NetSpawnPlayer(resourceLoadPathListScript.resourcesLoadList[0].filePathList[index].LoadAsGameObject, m_NetworkGameInfo.spawnDefinitions.RandomRoundRobinSpawnPosition(), Quaternion.identity, group) as GameObject;
            return clone;
        }
        public void SpawnOption()
        {
            if (m_NetworkGameInfo.autoInstantiatePlayer)
            {
                if (Network.isServer)
                {
                    if (serverSetting.mySetting.inputLanNet.IsDedicatedServer)
                    {
                        // This just tell the server to spawn an invisible playerToSentTo INDEX: 0 is an INVISIBLE PLAYER FOR DEDICATED SERVER
                        SpawnPlayer(0);
                    }
                    else
                    {
                        // This just tell the server to spawn the playerToSentTo
                        SpawnPlayer(m_NetworkGameInfo.playerPrefabIndex);
                    }
                }
                else
                {
                    if (ServerType.AuthoritativeServer == m_NetworkGameInfo.serverType)
                    {
                        // This is called by the CLIENT to tell the server to spawn the playerToSentTo.
                        //GetComponent<NetworkView>().RPC("SpawnPlayer", RPCMode.Server, Network.playerToSentTo, m_NetworkGameInfo.playerPrefabIndex, m_NetworkGameInfo.teamLayer);  // This RPC function is the issue; 
                    }
                    else
                    {
                        // Semi-Authoritative for higher lag option!
                        // Will be spawn by client!
                        SpawnPlayer(m_NetworkGameInfo.playerPrefabIndex);
                    }
                }
            }
        }
        #endregion

        #region Destorying Methods
        public static void DestroyGameObjectNetworkView(NetworkViewID viewID)
        {
            Debug.Log("Clean up NetworkViewID: " + viewID);
            Network.RemoveRPCs(viewID);
            Network.Destroy(viewID);
        }
        public static void DestroyPlayer(NetworkPlayer theOwner)
        {
            // Destroy all network gameobjects own by that playerToSentTo.
            Debug.Log("Clean up after playerToSentTo " + theOwner);
            Network.RemoveRPCs(theOwner);
            Network.DestroyPlayerObjects(theOwner);

            //// Find the client gameobject on the SERVER list and remove it from all players.
            //for (int i = m_NetworkGameInfo.otherPlayersPrefabs.Count - 1; i >= 0; i--)
            //{
            //    // Check for null since object may suddenly disconnect and be removed.
            //    if (m_NetworkGameInfo.otherPlayersPrefabs[i] == null)
            //    {
            //        m_NetworkGameInfo.otherPlayersPrefabs.RemoveAt(i);
            //    }
            //    else
            //    {
            //        // Cleaning up object controlled by client! (otherPlayersPrefabs list ERROR is occuring here since SYNCDATA.theOwner is null!!!)
            //        if (m_NetworkGameInfo.otherPlayersPrefabs[i].GetComponent<SyncData>().theOwner == theOwner)
            //        {
            //            Debug.Log("Testing Destroy");
            //            // Clean up the SERVER object that is controlled by that client!!! Note this is important for SERVER AUTHORITATIVE.
            //            Network.RemoveRPCs(m_NetworkGameInfo.otherPlayersPrefabs[i].GetComponent<NetworkView>().viewID);
            //            Network.Destroy(m_NetworkGameInfo.otherPlayersPrefabs[i]);
            //            m_NetworkGameInfo.otherPlayersPrefabs.RemoveAt(i);
            //        }
            //    }
            //}
        } 
        #endregion
	    #endregion

	    #region NAT & Proxy Change/Update
	    void NatProxyFalseForClientAndHostWithPublicIP()
	    {
	        UseNat = false;
	        UseProxy = false;
	    }

	    void NatProxyOption(bool toggleNatTrue_ProxyFalse)
	    {
	        if (toggleNatTrue_ProxyFalse)
	        {
	            // Update boolean
	            UseNat = true;
	            UseProxy = false;
	        }
	        else
	        {
	            // Update boolean
	            UseNat = false;
	            UseProxy = true;
	        }

	        // Output Text
	        Debug.Log("Using NAT: " + UseNat + "; Proxy: " + UseProxy);
	    }

	    void AddProxyInfoAndExternalIpToHostComment()
	    {
            NetworkPlayer player = Network.player;
	        //embed proxy info in host comment field so clients know what ip and port to connect
            if (UseProxy)
            {
                #if UNITY_EDITOR
                Debug.Log("Successfully started server with proxy support. We are connectable through " + player.ipAddress + ":" + player.port); 
                #endif
                serverSetting.mySetting.inputLanNet.UseProxy = true;
                serverSetting.mySetting.inputLanNet.proxyIp = player.ipAddress;
                serverSetting.mySetting.inputLanNet.proxyPort = player.port;
            }
            else
            {
                serverSetting.mySetting.inputLanNet.UseProxy = false;
                serverSetting.mySetting.inputLanNet.proxyIp = "";
                serverSetting.mySetting.inputLanNet.proxyPort = 0;
            }
	    }
	    #endregion

	    #region Messages will still run when script is DISABLE. MENU should have these callback function attached for events!

	    #region Master Server Messages (https://docs.unity3d.com/ScriptReference/MasterServer.html)
	    // Called on clients or servers when reporting events from the MasterServer.
	    void OnMasterServerEvent(MasterServerEvent msEvent)
	    {
	        Debug.Log("Master Server Connection Info: " + msEvent.ToString());
            testMasterServer = TestMasterServer.masterServerFound;
            switch (msEvent)
            {
                case MasterServerEvent.HostListReceived:
	                hostList = MasterServer.PollHostList();
                    StartCoroutine(AddHostListData());
                    break;
                case MasterServerEvent.RegistrationFailedGameName:
                    break;
                case MasterServerEvent.RegistrationFailedGameType:
                    break;
                case MasterServerEvent.RegistrationFailedNoServer:
                    break;
                case MasterServerEvent.RegistrationSucceeded:
	                if (Network.isServer && !requestHostFailed)
	                {
	                    Debug.Log("Server RegistrationSucceeded");
	                    // Register Host Successful
	                    RunAllOnRegisterHostSuccess();
	                }
	                else if (Network.isClient && !requestHostFailed)
	                {
	                    Debug.Log("Client RegistrationSucceeded");
	                }
	                else
	                {
	                    // Perform connection test. If connection is successful disconnect server and refresh host list. (NOTE: HostList Request have not started yet!)
	                    Debug.Log("Disconnecting & Start Host Request");
	                    UnregisterHostOrDisconnectClient_RefreshHostList();
	                }

                    Debug.Log("CheckMasterServerPing");
                    MasterServerNetworkManager.singleton.CheckMasterServerPing();

	                // Poll host listed is needed to grab the host list.
                    //hostList = MasterServer.PollHostList();
                    break;
                default:
                    break;
            }
	    }
	    // Called on clients or servers when there is a problem connecting to the master server.
	    void OnFailedToConnectToMasterServer(NetworkConnectionError info)
	    {
            testMasterServer = TestMasterServer.masterServerNotFound;
            ConnectToNextMasterServerAddress(info);
	    }

	    #region Master Server Event Function
        void ConnectToNextMasterServerAddress(NetworkConnectionError info)
        {
            if (indexOfMasterServerIP < masterNATProxyServers.masterServerIpAddresses.Count)
            {
                Debug.Log("Tried the following: MasterServer#" + indexOfMasterServerIP.ToString() + ", " + masterNATProxyServers.masterServerIpAddresses[indexOfMasterServerIP] + ", " + masterNATProxyServers.masterServerPorts[indexOfMasterServerIP].ToString() + ", " + masterNATProxyServers.natFacilitatorIpAddresses[indexOfMasterServerIP] + ", " + masterNATProxyServers.natFacilitatorPorts[indexOfMasterServerIP].ToString());
                // iterate through all the master server.
                StartCoroutine(WaitToReconnectToNewMasterServer(info));
            }
            else
            {
                Debug.LogError("Need list of MasterServer IP Address");
            }
        }

        IEnumerator WaitToReconnectToNewMasterServer(NetworkConnectionError info)
	    {
            Debug.Log("Master Server FAIL: " + info.ToString());
            masterServerResponse = info;
	        yield return null;
            switch (info)
            {
                case NetworkConnectionError.AlreadyConnectedToAnotherServer:
                    break;
                case NetworkConnectionError.AlreadyConnectedToServer:
                    MasterServerNetworkManager.singleton.m_NetworkMigrationManager.RunAllCannotFindMigrationHost();
                    break;
                case NetworkConnectionError.ConnectionBanned:
                    break;
                case NetworkConnectionError.ConnectionFailed:
                    ChangeMasterServerAndRetry();
                    break;
                case NetworkConnectionError.CreateSocketOrThreadFailure:
                    // See OnFailedToConnect for more detail if we can use it
                    if (peerTypeDesired == PeerTypeDesired.isServer)
                    {
                        timeFailed++;
                        if (timeFailed > serverSetting.portRange.EndPort - serverSetting.portRange.StartPort)
                        {
                            timeFailed = 0;
                            yield break;
                        }
                        if (serverSetting.mySetting.inputLanNet.port >= serverSetting.portRange.EndPort)
                        {
                            serverSetting.mySetting.inputLanNet.port = serverSetting.portRange.StartPort;
                        }
                        else
                        {
                            serverSetting.mySetting.inputLanNet.port++;
                        }
                        if (networkType == NetworkType.isNET)
                        {
                            StartNetworkServer(serverSetting.mySetting.inputLanNet.IsDedicatedServer);
                        }
                        else if (networkType == NetworkType.isLAN)
                        {
                            StartLocalAreaNetworkServer(serverSetting.mySetting.inputLanNet.IsDedicatedServer);
                        }
                    }
                    break;
                case NetworkConnectionError.EmptyConnectTarget:
                    break;
                case NetworkConnectionError.IncorrectParameters:
                    break;
                case NetworkConnectionError.InternalDirectConnectFailed:
                    yield return new WaitForSeconds(0.25f);
                    ChangeMasterServerAndRetry();
                    break;
                case NetworkConnectionError.InvalidPassword:
                    break;
                case NetworkConnectionError.NATPunchthroughFailed:
                    break;
                case NetworkConnectionError.NATTargetConnectionLost:
                    break;
                case NetworkConnectionError.NATTargetNotConnected:
                    testMasterServer = TestMasterServer.notTest;
                    indexOfMasterServerIP = 0;
                    requestHostFailed = false;
                    break;
                case NetworkConnectionError.NoError:
                    break;
                case NetworkConnectionError.RSAPublicKeyMismatch:
                    break;
                case NetworkConnectionError.TooManyConnectedPlayers:
                    break;
                default:
                    ChangeMasterServerAndRetry();
                    break;
            }
            //ChangeMasterServerAndRetry();
	    }
        IEnumerator AddHostListData()
        {
            serverSetting.otherNet.netHosts.Clear();
            for (int i = 0; i < hostList.Length; i++)
            {
                // Create the new variable
                LANNETData data = new LANNETData();
                serverSetting.otherNet.netHosts.Add(data);
                serverSetting.otherNet.netHosts[i].DecodeHostDataNET(hostList[i], i);

                // Stop loop until next frame to prevent possible lags
                if (i % MasterServerNetworkManager.singleton.CPULoad.loadNumber == 0)
                {
                    yield return null;
                }
            }
            RunAllAfterHostListReceived();
        }
	    #endregion
	    #endregion

	    #region Connection and Disconnection (https://docs.unity3d.com/ScriptReference/Network.html)

	    #region HOST & CLIENT Message + (HOST MIGRATION)
	    // HOST MIGRATION METHOD CAN STARTED HERE
	    // Called on client during disconnection from server, but also on the server when the connection has disconnected.
	    // https://docs.unity3d.com/ScriptReference/Network.Connect.html
	    void OnDisconnectedFromServer(NetworkDisconnection info)
	    {
//#if UNITY_EDITOR
//            Debug.Log("TempTimeClient: " + tempTime);
//#endif
            serverSetting.mySetting.inputLanNet.ClearCount();
	        if (Network.isServer)
	        {
	            Debug.Log("Local server connection disconnected");
	            m_NetworkMigrationManager.RunAllOnDisconnectedFromServerIsServer();
	        }
	        else
	        {
	            if (info == NetworkDisconnection.LostConnection)
	            {
                    Debug.Log("Client Lost Connection to the server\nClient NetworkDisconnection.Disconnected\nBest to start all players at beginning location or Make players all Semi-Transparent to represent temporary invincibility.");
                    m_NetworkMigrationManager.disconnectionError = NetworkDisconnectionType.LostConnection;
                    // Host Migration
                    if (m_NetworkMigrationManager.migrationStage == MigrationStage.checkMigration)
                    {
                        Debug.Log("RA_OnDisconnectedFromServerOnMigration");
                        m_NetworkMigrationManager.RunAllOnDisconnectedFromServerMigration();
                        LoadSceneWaitingScreen(true);
                    }
                    else
                    {
                        Debug.Log("Successfully disconnected from the server");
                        m_NetworkMigrationManager.RunAllOnDisconnectedFromServerRequest();
                    }
	            }
	            else if (info == NetworkDisconnection.Disconnected)
	            {
	                Debug.Log("Client NetworkDisconnection.Disconnected");
                    m_NetworkMigrationManager.disconnectionError = NetworkDisconnectionType.Disconnected;
	                // Location to start HOST MIGRATION for SERVER (BEST) (2nd HOST MIGRATION is at the MigrationStage.startMigration in case two host disconnect instantly.)
                    if (m_NetworkMigrationManager.migrationStage == MigrationStage.checkMigration || m_NetworkMigrationManager.migrationStage == MigrationStage.startMigration)
	                {
	                    Debug.Log("RA_OnDisconnectedFromServerOnMigration");
	                    m_NetworkMigrationManager.RunAllOnDisconnectedFromServerMigration();
                        LoadSceneWaitingScreen(true);
	                }
	                else
	                {
	                    Debug.Log("Successfully disconnected from the server");
	                    m_NetworkMigrationManager.RunAllOnDisconnectedFromServerRequest();
	                }
	            }
	        }
			if(m_NetworkMigrationManager.migrationStage != MigrationStage.startMigration)
			{
		        switch (networkType)
		        {
		            case NetworkType.isLAN:
                        LoadSceneAsync_Net(serverSetting.mySetting.inputLanNet.sceneBuildIndex, -1, 0, 0, m_NetworkGameInfo.offlineLoadTime);
		                break;
		            case NetworkType.isNET:
		            default:
		                if (!requestHostFailed)
		                {
                            LoadSceneAsync_Net(serverSetting.mySetting.inputLanNet.sceneBuildIndex, -1, 0, 0, m_NetworkGameInfo.offlineLoadTime);
		                }
		                break;
		        }
			}
	    }
        #region Testing Delete Later (Figuring out LostConnection TimeOut)
#if UNITY_EDITOR
        //float tempTime = -1;
        //public void SendOutDisconnectTimeButton()
        //{
        //    GetComponent<NetworkView>().RPC("SendoutDisconnectTime", RPCMode.Others);
        //    StartCoroutine(WaitFor5Sec());
        //}
        //[RPC]
        //void SendoutDisconnectTime()
        //{
        //    tempTime = 0;
        //    Debug.Log("TempTimeServer: " + tempTime);
        //}
        //IEnumerator WaitFor5Sec()
        //{
        //    yield return new WaitForSeconds(5);
        //    MasterServerNetworkManager.singleton.serverSetting.mySetting.inputLanNet.sceneBuildIndex = MasterServerNetworkManager.singleton.m_NetworkGameInfo.defaultOfflineSceneBuildIndex;
        //    UnregisterHostOrDisconnectClient_RefreshHostList();
        //}
        //void Update()
        //{
        //    if (tempTime > -1)
        //    {
        //        tempTime += Time.deltaTime;
        //    }
        //}
#endif
        #endregion

        // Called on the client when a connection attempt fails for some reason. Callback of Network.InitializeServer()
		int timeFailed;
        void RunAll_OnFailedToConnect(NetworkConnectionError info)
        {
            var gameObjects = FindObjectsOfType(typeof(GameObject)) as GameObject[];
            foreach (var go in gameObjects)
                go.SendMessage("OnFailedToConnect", info, SendMessageOptions.DontRequireReceiver);
        }
		void OnFailedToConnect(NetworkConnectionError info)
		{
			networkResponse = info;
			// For more about Network Connection Error Enum go to:
			// https://docs.unity3d.com/ScriptReference/NetworkConnectionError.html
            Debug.Log("NetworkConnectionError: " + info);
            if (MigrationStage.startMigration == m_NetworkMigrationManager.migrationStage && info != NetworkConnectionError.NoError)
            {
                m_NetworkMigrationManager.RunAllOnFailedToConnect_Migration(info);
            }
            //else
            //{
                switch (info)
                {
                    case NetworkConnectionError.AlreadyConnectedToAnotherServer:
                        break;
                    case NetworkConnectionError.AlreadyConnectedToServer:
                        testMasterServer = TestMasterServer.notTest;
                        indexOfMasterServerIP = 0;
                        requestHostFailed = false;
                        break;
                    case NetworkConnectionError.ConnectionBanned:
                        testMasterServer = TestMasterServer.notTest;
                        indexOfMasterServerIP = 0;
                        requestHostFailed = false;
                        break;
                    case NetworkConnectionError.ConnectionFailed:
                        testMasterServer = TestMasterServer.notTest;
                        indexOfMasterServerIP = 0;
                        requestHostFailed = false;

                        #region AutoConnect to next server by iterating through each port
                        //				if(peerTypeDesired == PeerTypeDesired.isClient)
                        //				{
                        //					timeFailed++;
                        //					if(timeFailed > serverSetting.portRange.EndPort - serverSetting.portRange.StartPort)
                        //					{
                        //						timeFailed = 0;
                        //						return;
                        //					}
                        //					if(networkType == NetworkType.isLAN) {
                        //						if (serverSetting.otherLan.host_Port_LAN >= serverSetting.portRange.EndPort) {
                        //							serverSetting.otherLan.host_Port_LAN = serverSetting.portRange.StartPort;
                        //						} else {
                        //							serverSetting.otherLan.host_Port_LAN++;
                        //						}
                        //					}
                        //					Join_LAN_Server();
                        //				}
                        #endregion

                        #region Cannot Start Server
                        //if (ForceUseNATProxy.forceUseProxy == serverSetting.otherNet.forceUseNATProxy)
                        //{
                        //    Debug.Log("Master Server: " + info.ToString());

                        //    if (indexOfMasterServerIP < masterNATProxyServers.masterServerIpAddresses.Count)
                        //    {
                        //        Debug.Log("Tried the following: MasterServer#" + indexOfMasterServerIP.ToString() + ", " + masterNATProxyServers.masterServerIpAddresses[indexOfMasterServerIP] + ", " + masterNATProxyServers.masterServerPorts[indexOfMasterServerIP].ToString() + ", " + masterNATProxyServers.natFacilitatorIpAddresses[indexOfMasterServerIP] + ", " + masterNATProxyServers.natFacilitatorPorts[indexOfMasterServerIP].ToString());
                        //        // iterate through all the master server.
                        //        StartCoroutine(WaitToReconnectToNewMasterServer());
                        //    } 
                        //}
                        #endregion

                        #region This could be any type of connection error: Master Server, Server Initialized, Facilitator, Proxy failure etc.

                        #endregion

                        break;
                    case NetworkConnectionError.CreateSocketOrThreadFailure:
                        if (peerTypeDesired == PeerTypeDesired.isServer)
                        {
                            timeFailed++;
                            if (timeFailed > serverSetting.portRange.EndPort - serverSetting.portRange.StartPort)
                            {
                                timeFailed = 0;
                                return;
                            }
                            if (serverSetting.mySetting.inputLanNet.port >= serverSetting.portRange.EndPort)
                            {
                                serverSetting.mySetting.inputLanNet.port = serverSetting.portRange.StartPort;
                            }
                            else
                            {
                                serverSetting.mySetting.inputLanNet.port++;
                            }
                            if (networkType == NetworkType.isNET)
                            {
                                StartNetworkServer(serverSetting.mySetting.inputLanNet.IsDedicatedServer);
                            }
                            else if (networkType == NetworkType.isLAN)
                            {
                                StartLocalAreaNetworkServer(serverSetting.mySetting.inputLanNet.IsDedicatedServer);
                            }
                        }
                        break;
                    case NetworkConnectionError.EmptyConnectTarget:
                        break;
                    case NetworkConnectionError.IncorrectParameters:
                        break;
                    case NetworkConnectionError.InternalDirectConnectFailed:
                        Debug.Log("Server may have disconnected");
                        break;
                    case NetworkConnectionError.InvalidPassword:
                        break;
                    case NetworkConnectionError.NATPunchthroughFailed:
                        break;
                    case NetworkConnectionError.NATTargetConnectionLost:
                        break;
                    case NetworkConnectionError.NATTargetNotConnected:
                        testMasterServer = TestMasterServer.notTest;
                        indexOfMasterServerIP = 0;
                        requestHostFailed = false;
                        break;
                    case NetworkConnectionError.NoError:
                        break;
                    case NetworkConnectionError.RSAPublicKeyMismatch:
                        break;
                    case NetworkConnectionError.TooManyConnectedPlayers:
                        Debug.Log("TooManyConnectedPlayers/Observers");
                        break;
                    default:
                        break;
                }
            //}
		}
	    #endregion

	    #region Host Server Message
	    // Called on the server whenever a Network.InitializeServer was invoked and has completed.
	    // Note playerToSentTo in this case is the playerToSentTo join.
	    void OnServerInitialized(NetworkPlayer player)
	    {
            #region My Player Ready Details
            m_NetworkGameInfo.optionalSetting.receivedAllPlayerDetails = true;

            PlayerBasicDetails playerToAdd = new PlayerBasicDetails(player,
                m_NetworkGameInfo.optionalSetting.myPlayerReadyDetail.playerID,
                false,
                serverSetting.mySetting.myLanNet.IsObserver,
                m_NetworkGameInfo.optionalSetting.myPlayerReadyDetail.playerName,
                m_NetworkGameInfo.optionalSetting.myPlayerReadyDetail.playerKill,
                m_NetworkGameInfo.optionalSetting.myPlayerReadyDetail.score
                );
            m_NetworkGameInfo.optionalSetting.playerReadyDetailList.Add(playerToAdd);

            m_NetworkGameInfo.optionalSetting.myPlayerReadyDetail = playerToAdd;
            #endregion

	        Debug.Log("Server initialized and ready");
	        Debug.Log("Player " + Network.connections.Length + " connected from " + player.ipAddress + ":" + player.port);
	        Debug.Log("Player externalIP: " + player.externalIP + ":" + player.externalPort + ", ipAddress: " + player.ipAddress + ":" + player.port + ", guid: " + player.guid);
            //NetworkMigrationManager.Pause_Unpause(true); // Server should not start pause since if other player start playing server need to start playing too.
	        switch (networkType)
	        {
	            case NetworkType.isLAN:
	                if (m_NetworkGameInfo.autoLoadSceneOnServerInitializeOrClientJoin)
	                {
                        LoadSceneAsync_Net(serverSetting.mySetting.inputLanNet.sceneBuildIndex, -1, 0, 0, m_NetworkGameInfo.onlineLoadTime);
	                }
                    MasterServerNetworkManager.singleton.serverSetting.mySetting.inputLanNet.EncodeHostDataLAN();
                    serverSetting.mySetting.myLan.savedLan = serverSetting.mySetting.inputLanNet.Clone();
                    Save_NetworkData();
	                break;
	            case NetworkType.isNET:
	            default:
	                if (!requestHostFailed)
	                {
	                    // Creating the "hostIPPortCommentSend" to be send across the server for client to connect using proxy.
	                    AddProxyInfoAndExternalIpToHostComment();

	                    // Registering Local Host Server to the Master Server (also register to NAT Facilitator) for others to connect
                        Debug.Log(serverSetting.mySetting.inputLanNet.GameName);
                        if (serverSetting.mySetting.inputLanNet.TotalConnections > 0)
                        {
                            Debug.Log(serverSetting.mySetting.inputLanNet.EncodeCommentNET());
                            MasterServer.RegisterHost(serverSetting.mySetting.inputLanNet.GameType, serverSetting.mySetting.inputLanNet.GameName, serverSetting.mySetting.inputLanNet.EncodeCommentNET());
                            serverSetting.mySetting.myNet.savedNet = serverSetting.mySetting.inputLanNet.Clone();
                            Save_NetworkData();
                        }

	                    if (m_NetworkGameInfo.autoLoadSceneOnServerInitializeOrClientJoin)
	                    {
                            LoadSceneAsync_Net(serverSetting.mySetting.inputLanNet.sceneBuildIndex, -1, 0, 0, m_NetworkGameInfo.onlineLoadTime);
	                    }
	                }
	                break;
	        }
	    }
	    // Called on the server whenever a new playerToSentTo has successfully connected.
	    int playerCount = 0;    // Player count could be change to Network.Connection
        // Called on the server whenever a new player has successfully connected.
	    void OnPlayerConnected(NetworkPlayer player)
	    {
            CheckForBannedPlayers(player);

	        // Save HOST MIGRATION DATA can be setup around here when playerToSentTo successfully connect!
	        playerCount = Network.connections.Length;
	        Debug.Log("Player " + playerCount + " connected from " + player.ipAddress + ":" + player.port);
	        Debug.Log("Player externalIP: " + player.externalIP + ":" + player.externalPort + ", ipAddress: " + player.ipAddress + ":" + player.port + ", guid: " + player.guid);
            //thisNetworkView.RPC("SendTimeScaleValue", player, Time.timeScale);

            ServerKickPlayerOutCheck(serverSetting.mySetting.hostLanNet, player);
	    }
        // Called on the server whenever a player disconnected from the server.
	    void OnPlayerDisconnected(NetworkPlayer player)
	    {
            AddToOnPlayerDisconnected(player);

	        // Clean up the disconnected client if there is anything they actually spawn. SendChatMessage RPC can be own by them.
	        // Later when using playerToSentTo authoritative method we need to delete playerToSentTo base on the NetworkPlayer option. Since it is now own by SERVER not CLIENT
	        DestroyPlayer(player);
	    }
	    #endregion

	    #region Client Message
	    // Called on the client when you have successfully connected to a server
	    void OnConnectedToServer()
	    {
	        Debug.Log("Connected to server");
            SendPlayerDetailsToServer();

            if (m_NetworkGameInfo.pauseOnConnectToServer)
            {
                NetworkMigrationManager.PauseUnpause(true); 
            }
	        if (m_NetworkGameInfo.autoLoadSceneOnServerInitializeOrClientJoin)
	        {
                LoadSceneAsync_Net(serverSetting.mySetting.inputLanNet.sceneBuildIndex, -1, 0, 0, m_NetworkGameInfo.onlineLoadTime);
	        }
	        // All code to run afterward should be place in the OnNetworkLoadedLevel now!!! (NOTE: RPC call won't run since all of them are turn off by LoadSceneAsync_Net)
	    }
	    #endregion

	    #endregion

	    #region Message (Careful about changing these messages!)
	    // Function to activate all "RA_OnProxyConnectionFailed" method
	    IEnumerator RunAllOnProxyConnectionFailed()
	    {
            yield return StartCoroutine(CoroutineUtilities.WaitForRealTime(5));
	        var gameObjects = FindObjectsOfType(typeof(GameObject)) as GameObject[];
	        foreach (var go in gameObjects)
	            go.SendMessage("RA_OnProxyConnectionFailed", SendMessageOptions.DontRequireReceiver);
	    }
	    // Call on Server & Client when connecting to proxy failed
	    void RA_OnProxyConnectionFailed()
	    {
	        Debug.Log("Action to take when PROXY registeration fail.");
	    }
	    // Function to activate all "RA_OnRegisterHostSuccess" method
	    void RunAllOnRegisterHostSuccess()
	    {
	        var gameObjects = FindObjectsOfType(typeof(GameObject)) as GameObject[];
	        foreach (var go in gameObjects)
	            go.SendMessage("RA_OnRegisterHostSuccess", SendMessageOptions.DontRequireReceiver);
	    }
	    // Call on Server & Client when RegisterHost is successful (EXCULDING: TestServerBeforeRefreshHostList case)
	    void RA_OnRegisterHostSuccess()
	    {
	        Debug.Log("Register host server to Master Server success.");
	    }

        void RunAllAfterHostListReceived()
        {
            var gameObjects = FindObjectsOfType(typeof(GameObject)) as GameObject[];
            foreach (var go in gameObjects)
                go.SendMessage("RA_AfterHostListReceived", SendMessageOptions.DontRequireReceiver);
        }
        void RA_AfterHostListReceived()
        {
            // NOTE: SEE RA_SortLanNetDone for when host list if finish sorting.
            SortingNetHost();
        }

	    // Function to activate all "RA_OnProxyConnectionFailed" method
	    void RunAllOnAllMasterServerFailed()
	    {
	        var gameObjects = FindObjectsOfType(typeof(GameObject)) as GameObject[];
	        foreach (var go in gameObjects)
	            go.SendMessage("RA_OnAllMasterServerFailed", SendMessageOptions.DontRequireReceiver);
	    }
	    // Call current playerToSentTo when all MasterServer in List failed (EXCULDING: TestServerBeforeRefreshHostList case)
	    void RA_OnAllMasterServerFailed()
	    {
	        Debug.Log("All Master Server are not available.");
	        // REQUIRE disconnect!!!
            if (peerTypeDesired == PeerTypeDesired.none)
            {
                Network.Disconnect();
                LoadSceneWaitingScreen(false);
            }
	    }
	    // Function to activate all "RA_OnWaitToRefreshHostList_Start" method
	    void RunAllOnWaitToRefreshHostList_Start()
	    {
	        var gameObjects = FindObjectsOfType(typeof(GameObject)) as GameObject[];
	        foreach (var go in gameObjects)
	            go.SendMessage("RA_OnWaitToRefreshHostList_Start", SendMessageOptions.DontRequireReceiver);
	    }
	    // Call when WaitToRefreshHostList start running
	    void RA_OnWaitToRefreshHostList_Start()
	    {
	        Debug.Log("Start to request host list begin.");
	    }
	    // Function to activate all "RA_OnWaitToRefreshHostList_End" method
	    void RunAllOnWaitToRefreshHostList_End()
	    {
	        var gameObjects = FindObjectsOfType(typeof(GameObject)) as GameObject[];
	        foreach (var go in gameObjects)
	            go.SendMessage("RA_OnWaitToRefreshHostList_End", SendMessageOptions.DontRequireReceiver);
	    }
	    // Call when WaitToRefreshHostList finish running
	    void RA_OnWaitToRefreshHostList_End()
	    {
	        Debug.Log("Waiting completed now requesting host list.");
	    }

        public void RunAllOnWaitForPlayerReadyStart()
        {
            var gameObjects = FindObjectsOfType(typeof(GameObject)) as GameObject[];
            foreach (var go in gameObjects)
                go.SendMessage("RA_OnWaitForPlayerReadyStart", SendMessageOptions.DontRequireReceiver);
        }
        void RA_OnWaitForPlayerReadyStart()
        {
            Debug.Log("Show Player Ready Button!");
        }
	    #endregion

	    #endregion

		#region LoadSceneAsync_Net (Loading Level)
	    IEnumerator LoadingNetworkDataWaitTime(float timeInSec)
	    {
	        // Wait Time so scene finish loading
            yield return StartCoroutine(CoroutineUtilities.WaitForRealTime(timeInSec));
	    }

		#region Level to load
	    public AsyncOperation sceneAsyncOperationResult;
	    int currentLevelPrefix;
	    /// <summary>
	    /// Refer to this link for details about this function. It is the NETWORKING version.
	    /// https://docs.unity3d.com/ScriptReference/SceneManagement.SceneManager.LoadSceneAsync.html
	    /// </summary>
	    /// <param name="sceneName"></param>
	    /// <param name="levelPrefix"></param>
	    /// <param name="group"></param>
	    /// <param name="mode">0 - LoadSceneMode.Single, 1 - LoadSceneMode.Additive</param>
	    /// <returns></returns>
	    public AsyncOperation LoadSceneAsync_Net(string sceneName, int levelPrefix = -1, int group = 0, int mode = 0, float waitTime = 0)
	    {
	        StartCoroutine(LoadSceneAsyncWait_Net(sceneName, levelPrefix, group, mode, waitTime));
            if (m_NetworkMigrationManager.migrationStage != MigrationStage.startMigration)
            {
                LoadSceneWaitingScreen(true); 
            }
	        return sceneAsyncOperationResult;
	    }

	    public AsyncOperation LoadSceneAsync_Net(int sceneBuildIndex, int levelPrefix = -1, int group = 0, int mode = 0, float waitTime = 0)
	    {
            if (sceneBuildIndex < 0)
            {
                return sceneAsyncOperationResult;
            }
            StartCoroutine(LoadSceneAsyncWait_Net(sceneBuildIndex, levelPrefix, group, mode, waitTime));
            if (m_NetworkMigrationManager.migrationStage != MigrationStage.startMigration)
            {
                LoadSceneWaitingScreen(true);
            }
	        return sceneAsyncOperationResult;
	    }

        IEnumerator LoadingNetworkDataWaitTime_Coroutine;
	    IEnumerator LoadSceneAsyncWait_Net(string sceneName, int levelPrefix = -1, int group = 0, int mode = 0, float waitTime = 0)
	    {
	        #region Networking Scene Loading Code
	        Debug.Log("Loading Scene...");

	        // https://docs.unity3d.com/Manual/net-NetworkLevelLoad.html
	        // There is no reason to send any more data over the network on the default channel,
	        // because we are about to load the level, thus all those objects will get deleted anyway
	        Network.SetSendingEnabled(group, false);

	        // We need to stop receiving because first the level must be loaded first.
	        // Once the level is loaded, rpc's and other state update attached to objects in the level are allowed to fire
	        Network.isMessageQueueRunning = false;

	        // All network views loaded from a level will get a prefix into their NetworkViewID.
	        // This will prevent old updates from clients leaking into a newly created scene.
	        if (levelPrefix == -1)
	        {
	            Network.SetLevelPrefix(currentLevelPrefix++);
	        }
	        else
	        {
	            currentLevelPrefix = levelPrefix;
	            Network.SetLevelPrefix(currentLevelPrefix);
	        }

	        // Old Reference
	        //SceneManager.LoadScene(sceneToLoad);    // Next frame to complete (always take current and next frame!!!)
	        //yield return null;  // wait until current frame complete
	        //yield return null;  // wait until NEXT frame complete

	        #region LoadSceneAsync
	        switch (mode)
	        {
	            case 1:
	                sceneAsyncOperationResult = SceneManager.LoadSceneAsync(sceneName, LoadSceneMode.Additive);
	                break;
	            case 0:
	            default:
	                sceneAsyncOperationResult = SceneManager.LoadSceneAsync(sceneName, LoadSceneMode.Single);
	                break;
	        }
	        sceneAsyncOperationResult.allowSceneActivation = false;	// Stop scene load at 0.9 (setting this to INSTANT true causes network problem)
	        yield return null;  // wait until current frame complete
	        yield return null;  // wait until NEXT frame complete
	        while (!sceneAsyncOperationResult.isDone)
	        {
				#if UNITY_EDITOR
	            float progress = Mathf.Clamp01(sceneAsyncOperationResult.progress / 0.9f);
	            Debug.Log("Loading progress: " + (progress * 100) + "%");
				#endif
	            // Loading Completed
	            if (sceneAsyncOperationResult.progress == 0.9f)
	            {
	                sceneAsyncOperationResult.allowSceneActivation = m_NetworkGameInfo.setAllowSceneActivation;
	            }
	            yield return null;
	        }
	        #endregion

	        // Allow receiving data again
	        Network.isMessageQueueRunning = true;
	        // Now the level has been loaded and we can start sending out data to clients
	        Network.SetSendingEnabled(group, true);

	        #endregion
            yield return StartCoroutine(WaitForReceiveAllPlayerDetails());
            #region Run All Messages
            if (m_NetworkMigrationManager.migrationStage == MigrationStage.startMigration)
            {
                RunAllOnLevelLoad_Migration_Awake1_Start1_BeforeWaitTime();
                Debug.Log("Wait for data syncing: " + waitTime + " sec");

                if (LoadingNetworkDataWaitTime_Coroutine != null)
                {
                    StopCoroutine(LoadingNetworkDataWaitTime_Coroutine);
                }
                LoadingNetworkDataWaitTime_Coroutine = LoadingNetworkDataWaitTime(waitTime);
                yield return StartCoroutine(LoadingNetworkDataWaitTime_Coroutine);
                
                Debug.Log("Start Running Code (RunAllOnLevelLoad)");
                RunAllOnLevelLoad_Migration_Awake2_Start2_AfterWaitTime();
                Debug.Log("Finish Running Code (RunAllOnLevelLoad)");
            }
            else
            {
                RunAllOnLevelLoad_Awake1_Start1_BeforeWaitTime();
                Debug.Log("Wait for data syncing: " + waitTime + " sec");

                if (LoadingNetworkDataWaitTime_Coroutine != null)
                {
                    StopCoroutine(LoadingNetworkDataWaitTime_Coroutine);
                }
                LoadingNetworkDataWaitTime_Coroutine = LoadingNetworkDataWaitTime(waitTime);
                yield return StartCoroutine(LoadingNetworkDataWaitTime_Coroutine);
                
                Debug.Log("Start Running Code (RunAllOnLevelLoad)");
                RunAllOnLevelLoad_Awake2_Start2_AfterWaitTime();
                Debug.Log("Finish Running Code (RunAllOnLevelLoad)");
            } 
            #endregion
	    }
        IEnumerator LoadSceneAsyncWait_Net(int sceneBuildIndex, int levelPrefix = -1, int group = 0, int mode = 0, float waitTime = 0)
        {
            #region Networking Scene Loading Code
            Debug.Log("Loading Scene...");

            // https://docs.unity3d.com/Manual/net-NetworkLevelLoad.html
            // There is no reason to send any more data over the network on the default channel,
            // because we are about to load the level, thus all those objects will get deleted anyway
            Network.SetSendingEnabled(group, false);

            // We need to stop receiving because first the level must be loaded first.
            // Once the level is loaded, rpc's and other state update attached to objects in the level are allowed to fire
            Network.isMessageQueueRunning = false;

            // All network views loaded from a level will get a prefix into their NetworkViewID.
            // This will prevent old updates from clients leaking into a newly created scene.
            if (levelPrefix == -1)
            {
                Network.SetLevelPrefix(currentLevelPrefix++);
            }
            else
            {
                currentLevelPrefix = levelPrefix;
                Network.SetLevelPrefix(currentLevelPrefix);
            }

            // Old Reference
            //SceneManager.LoadScene(sceneToLoad);    // Next frame to complete (always take current and next frame!!!)
            //yield return null;  // wait until current frame complete
            //yield return null;  // wait until NEXT frame complete

            #region LoadSceneAsync
            switch (mode)
            {
                case 1:
                    sceneAsyncOperationResult = SceneManager.LoadSceneAsync(sceneBuildIndex, LoadSceneMode.Additive);
                    break;
                case 0:
                default:
                    sceneAsyncOperationResult = SceneManager.LoadSceneAsync(sceneBuildIndex, LoadSceneMode.Single);
                    break;
            }
            sceneAsyncOperationResult.allowSceneActivation = false;	// Stop scene load at 0.9 (setting this to INSTANT true causes network problem)
            yield return null;  // wait until current frame complete
            yield return null;  // wait until NEXT frame complete
            while (!sceneAsyncOperationResult.isDone)
            {
                #if UNITY_EDITOR
                float progress = Mathf.Clamp01(sceneAsyncOperationResult.progress / 0.9f);
                Debug.Log("Loading progress: " + (progress * 100) + "%");
                #endif
                // Loading Completed
                if (sceneAsyncOperationResult.progress == 0.9f)
                {
                    sceneAsyncOperationResult.allowSceneActivation = m_NetworkGameInfo.setAllowSceneActivation;
                }
                yield return null;
            }
            #endregion

            // Allow receiving data again
            Network.isMessageQueueRunning = true;
            // Now the level has been loaded and we can start sending out data to clients
            Network.SetSendingEnabled(group, true);

            #endregion
            yield return StartCoroutine(WaitForReceiveAllPlayerDetails());
            #region Run All Messages
            if (m_NetworkMigrationManager.migrationStage == MigrationStage.startMigration)
            {
                RunAllOnLevelLoad_Migration_Awake1_Start1_BeforeWaitTime();
                Debug.Log("Wait for data syncing: " + waitTime + " sec");

                if (LoadingNetworkDataWaitTime_Coroutine != null)
                {
                    StopCoroutine(LoadingNetworkDataWaitTime_Coroutine);
                }
                LoadingNetworkDataWaitTime_Coroutine = LoadingNetworkDataWaitTime(waitTime);
                yield return StartCoroutine(LoadingNetworkDataWaitTime_Coroutine);
                
                Debug.Log("Start Running Code (RunAllOnLevelLoad)");
                RunAllOnLevelLoad_Migration_Awake2_Start2_AfterWaitTime();
                Debug.Log("Finish Running Code (RunAllOnLevelLoad)");
            }
            else
            {
                RunAllOnLevelLoad_Awake1_Start1_BeforeWaitTime();
                Debug.Log("Wait for data syncing: " + waitTime + " sec");

                if (LoadingNetworkDataWaitTime_Coroutine != null)
                {
                    StopCoroutine(LoadingNetworkDataWaitTime_Coroutine); 
                }
                LoadingNetworkDataWaitTime_Coroutine = LoadingNetworkDataWaitTime(waitTime);
                yield return StartCoroutine(LoadingNetworkDataWaitTime_Coroutine);
                
                Debug.Log("Start Running Code (RunAllOnLevelLoad)");
                RunAllOnLevelLoad_Awake2_Start2_AfterWaitTime();
                Debug.Log("Finish Running Code (RunAllOnLevelLoad)");
            }
            #endregion
        }

		[RPC]	// Networking Option
	    void LevelToLoad_RPC(string sceneName, int levelPrefix = -1, int group = 0, int mode = 0, float waitTime = 0)
		{
	        LoadSceneAsync_Net(sceneName, levelPrefix, group, mode, waitTime);
		}
		#endregion

		#region Load Level Message
	    void RunAllOnLevelLoad_Awake1_Start1_BeforeWaitTime()
	    {
	        var gameObjects = FindObjectsOfType(typeof(GameObject)) as GameObject[];
            foreach (var go in gameObjects)
                go.SendMessage("RA_OnLevelLoad_Awake1", SendMessageOptions.DontRequireReceiver);
            foreach (var go in gameObjects)
                go.SendMessage("RA_OnLevelLoad_Start1", SendMessageOptions.DontRequireReceiver);
            foreach (var go in gameObjects)
	            go.SendMessage("RA_OnLevelLoad_BeforeWaitTime", SendMessageOptions.DontRequireReceiver);
	    }
		void RunAllOnLevelLoad_Awake2_Start2_AfterWaitTime()
		{
			var gameObjects = FindObjectsOfType(typeof(GameObject)) as GameObject[];
            foreach (var go in gameObjects)
                go.SendMessage("RA_OnLevelLoad_Awake2", SendMessageOptions.DontRequireReceiver);
            foreach (var go in gameObjects)
                go.SendMessage("RA_OnLevelLoad_Start2", SendMessageOptions.DontRequireReceiver);
			foreach (var go in gameObjects)
				go.SendMessage("RA_OnLevelLoad_AfterWaitTime", SendMessageOptions.DontRequireReceiver);
		}
        void RunAllOnLevelLoad_Migration_Awake1_Start1_BeforeWaitTime()
        {
            var gameObjects = FindObjectsOfType(typeof(GameObject)) as GameObject[];
            foreach (var go in gameObjects)
                go.SendMessage("RA_OnLevelLoad_Migration_Awake1", SendMessageOptions.DontRequireReceiver);
            foreach (var go in gameObjects)
                go.SendMessage("RA_OnLevelLoad_Migration_Start1", SendMessageOptions.DontRequireReceiver);
            foreach (var go in gameObjects)
                go.SendMessage("RA_OnLevelLoad_Migration_BeforeWaitTime", SendMessageOptions.DontRequireReceiver);
        }
        void RunAllOnLevelLoad_Migration_Awake2_Start2_AfterWaitTime()
        {
            var gameObjects = FindObjectsOfType(typeof(GameObject)) as GameObject[];
            foreach (var go in gameObjects)
                go.SendMessage("RA_OnLevelLoad_Migration_Awake2", SendMessageOptions.DontRequireReceiver);
            foreach (var go in gameObjects)
                go.SendMessage("RA_OnLevelLoad_Migration_Start2", SendMessageOptions.DontRequireReceiver);
            foreach (var go in gameObjects)
                go.SendMessage("RA_OnLevelLoad_Migration_AfterWaitTime", SendMessageOptions.DontRequireReceiver);
        }

        void RA_OnLevelLoad_Awake1() { }
        void RA_OnLevelLoad_Start1() { }
	    void RA_OnLevelLoad_BeforeWaitTime() { }
        void RA_OnLevelLoad_Migration_Awake1() { }
        void RA_OnLevelLoad_Migration_Start1() { }
        void RA_OnLevelLoad_Migration_BeforeWaitTime() { }

        void RA_OnLevelLoad_Awake2() { }
        void RA_OnLevelLoad_Start2() { }
        void RA_OnLevelLoad_AfterWaitTime()
        {
            if (Network.peerType != NetworkPeerType.Disconnected)
            {
                Debug.Log("Connected to server: Online");
                //LoadSceneWaiting Screen(false);
                SpawnOption();
            }
            else
            {
                Debug.Log("Connected to server: Offline");
                LoadSceneWaitingScreen(false);
            }
        }
        void RA_OnLevelLoad_Migration_Awake2() { }
        void RA_OnLevelLoad_Migration_Start2() { }
        void RA_OnLevelLoad_Migration_AfterWaitTime()
        {
            //LoadSceneWaiting Screen(false);    // Now moved to NETWORK MIGRATION MANAGER SCRIPT
        }
		#endregion

        #region ScreenLoad
        public void LoadSceneWaitingScreen(bool enable)
        {
            m_NetworkGameInfo.loadSceneWaitScreen.LoadEventWindowsObject(StringExtension.ReturnResourcePathByObjectName("SceneLoadingScreen"), enable);
        }

        public void LoadErrorMessageScreen(bool enable)
        {
            m_NetworkGameInfo.loadSceneWaitScreen.LoadEventWindowsObject(StringExtension.ReturnResourcePathByObjectName("ErrorMessageScreen"), enable);
        }
        #endregion
		#endregion

		#region Player Pooling Methods
		public MasterServerObjectList CreatePlayerPoolList(SyncData syncDataScript)
		{
			MasterServerObjectList msol = syncDataScript.gameObject.AddComponent<MasterServerObjectList_Player>();
			syncDataScript.masterServerObjectList = msol;
			return msol;
		}
		#endregion

		#region InputField Example
	    public void UpdateHost_IPAddress_LAN(string ipAddress)
	    {
			serverSetting.mySetting.inputLanNet.ip = ipAddress;
	    }
	    public void UpdateHost_Port_LAN(string port)
	    {
            int portInt;
			int.TryParse(port, out portInt);
            serverSetting.mySetting.inputLanNet.port = portInt;
            if (serverSetting.mySetting.inputLanNet.port < serverSetting.portRange.StartPort || serverSetting.mySetting.inputLanNet.port > serverSetting.portRange.EndPort - 1)
	        {
                serverSetting.mySetting.inputLanNet.port = serverSetting.portRange.StartPort;
	        }
	    }
		#endregion

        #region Optional Setting Methods
        NetworkPlayer sender;
        public void AddToOnPlayerDisconnected(NetworkPlayer player)
        {
            MasterServerNetworkManager.singleton.thisNetworkView.RPC("PlayerDetailsRemoveFromList", RPCMode.All, player);
        }
        public void SendPlayerDetailsToServer()
        {
            m_NetworkGameInfo.optionalSetting.myPlayerReadyDetail = new PlayerBasicDetails(Network.player,
                m_NetworkGameInfo.optionalSetting.myPlayerReadyDetail.playerID,
                false,
                serverSetting.mySetting.myLanNet.IsObserver,
                m_NetworkGameInfo.optionalSetting.myPlayerReadyDetail.playerName,
                m_NetworkGameInfo.optionalSetting.myPlayerReadyDetail.playerKill,
                m_NetworkGameInfo.optionalSetting.myPlayerReadyDetail.score
                );
            MasterServerNetworkManager.singleton.thisNetworkView.RPC("SendPlayerDetailsToServer_R", RPCMode.Server,
                m_NetworkGameInfo.optionalSetting.myPlayerReadyDetail.playerID,
                false,
                serverSetting.mySetting.myLanNet.IsObserver,
                m_NetworkGameInfo.optionalSetting.myPlayerReadyDetail.playerName,
                m_NetworkGameInfo.optionalSetting.myPlayerReadyDetail.playerKill,
                m_NetworkGameInfo.optionalSetting.myPlayerReadyDetail.score
                );
        }
        [RPC] public void SendPlayerDetailsToServer_R(string playerID3, bool ready3, bool observer3, string name3, int killCount3, int score3, NetworkMessageInfo info)
        {
            if (info.sender.ToString() == "-1")
            {
                sender = Network.player;
            }
            else
            {
                sender = info.sender;
            }
            MasterServerNetworkManager.singleton.thisNetworkView.RPC("PlayerDetailsAddToList", RPCMode.All,
                sender,
                playerID3,
                ready3,
                observer3,
                name3,
                killCount3,
                score3
                );

            for (int i = m_NetworkGameInfo.optionalSetting.playerReadyDetailList.Count - 1; i >= 0; i--)
            {
                if (sender != m_NetworkGameInfo.optionalSetting.playerReadyDetailList[i].networkPlayer)
                {
                    MasterServerNetworkManager.singleton.thisNetworkView.RPC("PlayerDetailsAddToList", sender,
                        m_NetworkGameInfo.optionalSetting.playerReadyDetailList[i].networkPlayer,
                        m_NetworkGameInfo.optionalSetting.playerReadyDetailList[i].playerID,
                        m_NetworkGameInfo.optionalSetting.playerReadyDetailList[i].readyToStart,
                        m_NetworkGameInfo.optionalSetting.playerReadyDetailList[i].isObserver,
                        m_NetworkGameInfo.optionalSetting.playerReadyDetailList[i].playerName,
                        m_NetworkGameInfo.optionalSetting.playerReadyDetailList[i].playerKill,
                        m_NetworkGameInfo.optionalSetting.playerReadyDetailList[i].score
                        );
                }
            }

            // Sending Done
            StartCoroutine(WaitBeforeSendingDoneInfo(sender));
        }
        [RPC] public void PlayerReady(NetworkMessageInfo info)
        {
            m_NetworkGameInfo.optionalSetting.numberOfPlayerReady = 0;
            if (info.sender.ToString() == "-1")
            {
                sender = Network.player;
                MasterServerNetworkManager.singleton.m_NetworkGameInfo.optionalSetting.myPlayerReadyBeforeMigration = true;
            }
            else
            {
                sender = info.sender;
            }
            if (Network.player == sender)
            {
                m_NetworkGameInfo.optionalSetting.myPlayerReadyDetail.readyToStart = true;
            }
            for (int i = m_NetworkGameInfo.optionalSetting.playerReadyDetailList.Count - 1; i >= 0; i--)
            {
                if (sender == m_NetworkGameInfo.optionalSetting.playerReadyDetailList[i].networkPlayer)
                {
                    m_NetworkGameInfo.optionalSetting.playerReadyDetailList[i].readyToStart = true;
                }
                if (m_NetworkGameInfo.optionalSetting.playerReadyDetailList[i].readyToStart == true)
                {
                    m_NetworkGameInfo.optionalSetting.numberOfPlayerReady++;
                }
            }
        }
        [RPC] public void PlayerNotReady(NetworkMessageInfo info)
        {
            m_NetworkGameInfo.optionalSetting.numberOfPlayerReady = 0;
            if (info.sender.ToString() == "-1")
            {
                sender = Network.player;
                MasterServerNetworkManager.singleton.m_NetworkGameInfo.optionalSetting.myPlayerReadyBeforeMigration = true;
            }
            else
            {
                sender = info.sender;
            }
            if (Network.player == sender)
            {
                m_NetworkGameInfo.optionalSetting.myPlayerReadyDetail.readyToStart = false;
            }
            for (int i = m_NetworkGameInfo.optionalSetting.playerReadyDetailList.Count - 1; i >= 0; i--)
            {
                if (sender == m_NetworkGameInfo.optionalSetting.playerReadyDetailList[i].networkPlayer)
                {
                    m_NetworkGameInfo.optionalSetting.playerReadyDetailList[i].readyToStart = false;
                }
                if (m_NetworkGameInfo.optionalSetting.playerReadyDetailList[i].readyToStart == true)
                {
                    m_NetworkGameInfo.optionalSetting.numberOfPlayerReady++;
                }
            }
        }
        [RPC] public void PlayerDetailsAddToList(NetworkPlayer player, string playerID, bool ready, bool observer, string name2, int killCount2, int score2)
        {
            bool exist = false;
            for (int i = 0; i < m_NetworkGameInfo.optionalSetting.playerReadyDetailList.Count; i++)
            {
                if (m_NetworkGameInfo.optionalSetting.playerReadyDetailList[i].networkPlayer == player)
                {exist = true;}
            }
            // Only Add to list if it doesn't exist
            if (!exist)
            {
                PlayerBasicDetails playerToAdd = new PlayerBasicDetails(player, playerID, ready, observer, name2, killCount2, score2);
                m_NetworkGameInfo.optionalSetting.playerReadyDetailList.Add(playerToAdd); 
            }

            // Only Sort when checking to limit server cpu load
            //m_NetworkGameInfo.optionalSetting.playerReadyDetailList.Sort();
        }
        [RPC] public void PlayerDetailsRemoveFromList(NetworkPlayer player)
        {
            for (int i = m_NetworkGameInfo.optionalSetting.playerReadyDetailList.Count - 1; i >= 0; i--)
            {
                if (m_NetworkGameInfo.optionalSetting.playerReadyDetailList[i].networkPlayer == player)
                {
                    m_NetworkGameInfo.optionalSetting.playerReadyDetailList.RemoveAt(i);
                }
            }
        }
        [RPC] public void DoneSendingPlayerListDetailsToClient()
        {
            for (int i = 0; i < m_NetworkGameInfo.optionalSetting.playerReadyDetailList.Count; i++)
            {
                if (m_NetworkGameInfo.optionalSetting.playerReadyDetailList[i].networkPlayer == Network.player)
                {
                    if (string.IsNullOrEmpty(m_NetworkGameInfo.optionalSetting.myPlayerReadyDetail.playerName))
	                {
                        m_NetworkGameInfo.optionalSetting.myPlayerReadyDetail.playerName = "Player " + Network.player.ToString();
	                }
                    int.TryParse(m_NetworkGameInfo.optionalSetting.playerReadyDetailList[i].networkPlayer.ToString(), out m_NetworkGameInfo.optionalSetting.myPlayerReadyDetail.playerNumber);
                }
            }
            m_NetworkGameInfo.optionalSetting.receivedAllPlayerDetails = true;
            RunAllDoneSendingPlayerListDetailsToClient();
        }
        IEnumerator WaitBeforeSendingDoneInfo(NetworkPlayer player)
        {
            // Wait a frame so this will run in order. All RPC send on same frame will received in wrong order. Can only distinguish it if it is different frame.
            yield return null;
            //yield return StartCoroutine(CoroutineUtilities.WaitForRealTime(0.1f));    // a frame is good enough
            thisNetworkView.RPC("DoneSendingPlayerListDetailsToClient", player);
        }
        IEnumerator WaitForReceiveAllPlayerDetails()
        {
            while (!m_NetworkGameInfo.optionalSetting.receivedAllPlayerDetails && Network.isClient)
            {
                yield return null;
            }
            //Debug.LogError("Player#: " + Network.player.ToString() + ". Calling Network.player.ToString() after this is correct");
        }

        void RunAllDoneSendingPlayerListDetailsToClient()
        {
            var gameObjects = FindObjectsOfType(typeof(GameObject)) as GameObject[];
            foreach (var go in gameObjects)
                go.SendMessage("RA_ChatMessageReceived", SendMessageOptions.DontRequireReceiver);
        }
        void RA_DoneSendingPlayerListDetailsToClient()
        {

        }
        #endregion

        #region Sorting LanNet Host List
        Ping masterServerPing;
        List<LANNETData> tempLanNetList;
        public Coroutine autoRefreshSingleton;
        [ReadOnly] public NetworkType previousNetworkType;

        public void AutoRefreshHostListStart(bool falseToStopAutoRefreshHostList_Quit = true)
        {
            // Stop any current "autoRefreshSingleton" from running
            if (autoRefreshSingleton != null)
            {
                StopCoroutine(autoRefreshSingleton);
            }

            if (!falseToStopAutoRefreshHostList_Quit) return;

            autoRefreshSingleton = StartCoroutine(AutoRefreshHostListStart_Repeat());
        }
        IEnumerator AutoRefreshHostListStart_Repeat()
        {
            //yield return null;
            Debug.Log("Network.isServer: " + Network.isServer + "\nNetwork.isClient: " + Network.isClient + "\nNetworkType: " + networkType);
            while(!(Network.isServer || Network.isClient))
            {
                Debug.Log("AutoRefreshHostList");
                if (previousNetworkType == NetworkType.isLAN)
                {
                    SortingLanHost();
                    yield return StartCoroutine(CoroutineUtilities.WaitForRealTime(serverSetting.sortingOption.autoRefreshRateLAN));
                }
                else if (previousNetworkType == NetworkType.isNET)
                {
                    RefreshHostList();
                    yield return StartCoroutine(CoroutineUtilities.WaitForRealTime(serverSetting.sortingOption.autoRefreshRateNET));
                }
            }
        }

        public void SortingLanHost()
        {
            #region LAN
            switch (serverSetting.sortingOption.sortHostList)
            {
                case HostListSort.ABC:
                    serverSetting.otherLan.lanHostSortABC = serverSetting.otherLan.lanHosts;
                    serverSetting.otherLan.lanHostSortABC.Sort(new LANNETData.SortMethods.SortByGamenameAscending());
                    serverSetting.sortedHostList = serverSetting.otherLan.lanHostSortABC;
                    RunAllSortLanNetDone();
                    break;
                case HostListSort.CBA:
                    serverSetting.otherLan.lanHostSortCBA = serverSetting.otherLan.lanHosts;
                    serverSetting.otherLan.lanHostSortCBA.Sort(new LANNETData.SortMethods.SortByGamenameDescending());
                    serverSetting.sortedHostList = serverSetting.otherLan.lanHostSortCBA;
                    RunAllSortLanNetDone();
                    break;
                case HostListSort.ABCThenPing:
                case HostListSort.CBAThenPing:
                case HostListSort.PingThenABC:
                case HostListSort.PingThenCBA:
                    RequestHostServerPing();
                    break;
                case HostListSort.Search:
                    LANNETData.Search(serverSetting.sortingOption.hostListSearchValue, serverSetting.otherLan.lanHosts, serverSetting.otherLan.lanHostSortSearch);
                    serverSetting.otherLan.lanHostSortSearch.Sort(new LANNETData.SortMethods.SortByGamenameAscending());
                    // NOTE: This line copy and modified the original Host List!
                    tempLanNetList = ObjectCopier.Clone(serverSetting.otherLan.lanHostSortSearch);
                    serverSetting.sortedHostList = tempLanNetList;
                    RunAllSortLanNetDone();
                    break;
                default:
                    serverSetting.sortedHostList = serverSetting.otherLan.lanHosts;
                    RunAllSortLanNetDone();
                    break;
            }
            #endregion
        }
        public void SortingNetHost()
        {
            #region NET
            switch (serverSetting.sortingOption.sortHostList)
            {
                case HostListSort.ABC:
                    serverSetting.otherNet.netHostSortABC = serverSetting.otherNet.netHosts;
                    serverSetting.otherNet.netHostSortABC.Sort(new LANNETData.SortMethods.SortByGamenameAscending());
                    serverSetting.sortedHostList = serverSetting.otherNet.netHostSortABC;
                    RunAllSortLanNetDone();
                    break;
                case HostListSort.CBA:
                    serverSetting.otherNet.netHostSortCBA = serverSetting.otherNet.netHosts;
                    serverSetting.otherNet.netHostSortCBA.Sort(new LANNETData.SortMethods.SortByGamenameDescending());
                    serverSetting.sortedHostList = serverSetting.otherNet.netHostSortCBA;
                    RunAllSortLanNetDone();
                    break;
                case HostListSort.ABCThenPing:
                case HostListSort.CBAThenPing:
                case HostListSort.PingThenABC:
                case HostListSort.PingThenCBA:
                    RequestHostServerPing();
                    break;
                case HostListSort.Search:
                    LANNETData.Search(serverSetting.sortingOption.hostListSearchValue, serverSetting.otherNet.netHosts, serverSetting.otherNet.netHostSortSearch);
                    serverSetting.otherNet.netHostSortSearch.Sort(new LANNETData.SortMethods.SortByGamenameAscending());
                    // NOTE: This line copy and modified the original netHosts list!
                    tempLanNetList = ObjectCopier.Clone(serverSetting.otherNet.netHostSortSearch);
                    serverSetting.sortedHostList = tempLanNetList;
                    RunAllSortLanNetDone();
                    break;
                default:
                    serverSetting.sortedHostList = serverSetting.otherNet.netHosts;
                    RunAllSortLanNetDone();
                    break;
            }
            #endregion
        }
        public void CheckMasterServerPing()
        {
            masterServerPing = new Ping(masterNATProxyServers.masterServerIpAddresses[indexOfMasterServerIP]);
            StartCoroutine(WaitToReceiveMasterServerPing(masterServerPing));
        }
        public void RequestHostServerPing()
        {
            if (networkType == NetworkType.isNET)
            {
                StartCoroutine(SendPingToAllNetHost());
            }
            else
            {
                StartCoroutine(SendPingToAllLanHost());
            }
        }
        
        // Sending PING to LAN is not necessary. Also LAN PING will fail.
        IEnumerator SendPingToAllLanHost()
        {
            serverSetting.mySetting.pingList.Clear();
            for (int i = 0; i < MasterServerNetworkManager.singleton.serverSetting.otherLan.lanHosts.Count; i++)
            {
                //Ping newPing = new Ping(serverSetting.otherLan.lanHosts[i].ip);
                //PingParameters newPingParameters = new PingParameters(newPing);
                //serverSetting.mySetting.pingList.Add(newPingParameters);
                //StartCoroutine(WaitToReceiveHostPing(newPing, i));

                Ping newPing = new Ping(serverSetting.otherLan.lanHosts[i].externalIp);
                PingParameters newPingParameters = new PingParameters(newPing);
                serverSetting.mySetting.pingList.Add(newPingParameters);
                StartCoroutine(WaitToReceiveHostPing(newPing, i, serverSetting.otherLan.lanHosts));

                //// Find if the ExternalIP in lanHosts already in pingList if it is PING will not be send again.
                //int j = serverSetting.mySetting.pingList.FindIndex(x => x.ip.Equals(serverSetting.otherLan.lanHosts[i].ip));

                //if (j == -1)
                //{
                //    Ping newPing = new Ping(serverSetting.otherLan.lanHosts[i].ip);
                //    PingParameters newPingParameters = new PingParameters(newPing);
                //    serverSetting.mySetting.pingList.Add(newPingParameters);
                //    StartCoroutine(WaitToReceiveHostPing(newPing, i));
                //}
                //else
                //{
                //    PingParameters newPingParameters = new PingParameters();
                //    serverSetting.mySetting.pingList.Add(newPingParameters);
                //    serverSetting.mySetting.pingList[i] = serverSetting.mySetting.pingList[j];
                //}
            }

            float endPingWaiting = Time.realtimeSinceStartup + 1;   // .9 sec wait need to be more then "Wait To Receive Master Server Ping" wait.
            while (Time.realtimeSinceStartup < endPingWaiting)
            {
                yield return null;
            }

            #region Sorting Section
            switch (serverSetting.sortingOption.sortHostList)
            {
                case HostListSort.ABCThenPing:
                    serverSetting.otherLan.lanHostSortABCPing = serverSetting.otherLan.lanHosts;
                    serverSetting.otherLan.lanHostSortABCPing.Sort(new LANNETData.SortMethods.SortByGamenamePingAscending());
                    serverSetting.sortedHostList = serverSetting.otherLan.lanHostSortABCPing;
                    break;
                case HostListSort.CBAThenPing:
                    serverSetting.otherLan.lanHostSortCBAPing = serverSetting.otherLan.lanHosts;
                    serverSetting.otherLan.lanHostSortCBAPing.Sort(new LANNETData.SortMethods.SortByGamenamePingDescending());
                    serverSetting.sortedHostList = serverSetting.otherLan.lanHostSortCBAPing;
                    break;
                case HostListSort.PingThenABC:
                    serverSetting.otherLan.lanHostSortPingABC = serverSetting.otherLan.lanHosts;
                    serverSetting.otherLan.lanHostSortPingABC.Sort(new LANNETData.SortMethods.SortByPingGamenameAscending());
                    serverSetting.sortedHostList = serverSetting.otherLan.lanHostSortPingABC;
                    break;
                case HostListSort.PingThenCBA:
                    serverSetting.otherLan.lanHostSortPingCBA = serverSetting.otherLan.lanHosts;
                    serverSetting.otherLan.lanHostSortPingCBA.Sort(new LANNETData.SortMethods.SortByPingGamenameDescending());
                    serverSetting.sortedHostList = serverSetting.otherLan.lanHostSortPingCBA;
                    break;
                default:
                    break;
            }
            RunAllSortLanNetDone(); 
            #endregion
        }
        IEnumerator SendPingToAllNetHost()
        {
            serverSetting.mySetting.pingList.Clear();
            for (int i = 0; i < MasterServerNetworkManager.singleton.serverSetting.otherNet.netHosts.Count; i++)
            {
                Ping newPing = new Ping(serverSetting.otherNet.netHosts[i].externalIp);
                PingParameters newPingParameters = new PingParameters(newPing);
                serverSetting.mySetting.pingList.Add(newPingParameters);
                StartCoroutine(WaitToReceiveHostPing(newPing, i, serverSetting.otherNet.netHosts));

                //// Find if the ExternalIP in netHosts already in pingList if it is PING will not be send again.
                //int j = serverSetting.mySetting.pingList.FindIndex(x => x.ip.Equals(serverSetting.otherNet.netHosts[i].externalIp));

                //if (j == -1)
                //{
                //    Ping newPing = new Ping(serverSetting.otherNet.netHosts[i].externalIp);
                //    PingParameters newPingParameters = new PingParameters(newPing);
                //    serverSetting.mySetting.pingList.Add(newPingParameters);
                //    StartCoroutine(WaitToReceiveHostPing(newPing, i));
                //}
                //else
                //{
                //    PingParameters newPingParameters = new PingParameters();
                //    serverSetting.mySetting.pingList.Add(newPingParameters);
                //    serverSetting.mySetting.pingList[i] = serverSetting.mySetting.pingList[j];
                //}
            }

            float endPingWaiting = Time.realtimeSinceStartup + 1;   // .9 sec wait need to be more then "Wait To Receive Master Server Ping" wait.
            while (Time.realtimeSinceStartup < endPingWaiting)
            {
                yield return null;
            }

            #region Sorting Section
            switch (serverSetting.sortingOption.sortHostList)
            {
                case HostListSort.ABCThenPing:
                    serverSetting.otherNet.netHostSortABCPing = serverSetting.otherNet.netHosts;
                    serverSetting.otherNet.netHostSortABCPing.Sort(new LANNETData.SortMethods.SortByGamenamePingAscending());
                    serverSetting.sortedHostList = serverSetting.otherNet.netHostSortABCPing;
                    break;
                case HostListSort.CBAThenPing:
                    serverSetting.otherNet.netHostSortCBAPing = serverSetting.otherNet.netHosts;
                    serverSetting.otherNet.netHostSortCBAPing.Sort(new LANNETData.SortMethods.SortByGamenamePingDescending());
                    serverSetting.sortedHostList = serverSetting.otherNet.netHostSortCBAPing;
                    break;
                case HostListSort.PingThenABC:
                    serverSetting.otherNet.netHostSortPingABC = serverSetting.otherNet.netHosts;
                    serverSetting.otherNet.netHostSortPingABC.Sort(new LANNETData.SortMethods.SortByPingGamenameAscending());
                    serverSetting.sortedHostList = serverSetting.otherNet.netHostSortPingABC;
                    break;
                case HostListSort.PingThenCBA:
                    serverSetting.otherNet.netHostSortPingCBA = serverSetting.otherNet.netHosts;
                    serverSetting.otherNet.netHostSortPingCBA.Sort(new LANNETData.SortMethods.SortByPingGamenameDescending());
                    serverSetting.sortedHostList = serverSetting.otherNet.netHostSortPingCBA;
                    break;
                default:
                    break;
            }
            RunAllSortLanNetDone(); 
            #endregion
        }
        IEnumerator WaitToReceiveMasterServerPing(Ping waitingPing)
        {
            float endPingWaiting = Time.realtimeSinceStartup + 1;   // 1 sec wait
            while (!waitingPing.isDone && Time.realtimeSinceStartup < endPingWaiting)
            {
                yield return null;
            }
            if (waitingPing.isDone)
            {
                serverSetting.mySetting.inputLanNet.pingToMasterServer = waitingPing.time;
            }
            else
            {
                serverSetting.mySetting.inputLanNet.pingToMasterServer = 1000;
            }
            Debug.Log("MasterServer Ping Time: " + serverSetting.mySetting.inputLanNet.pingToMasterServer + "ms");
            RunAllPingToMasterServerDone();
        }
        IEnumerator WaitToReceiveHostPing(Ping waitingPing, int index, List<LANNETData> hostList)
        {
            float endPingWaiting = Time.realtimeSinceStartup + 0.8f;   // 1 sec wait
            while (!waitingPing.isDone && Time.realtimeSinceStartup < endPingWaiting)
            {
                yield return null;
            }
            //if (index < serverSetting.mySetting.pingList.Count)
            //{
                if (waitingPing.isDone)
                {
                    hostList[index].pingFromClientToHostServer = waitingPing.time;
                    serverSetting.mySetting.pingList[index].SetPingParameters(waitingPing);
                }
                else
                {
                    hostList[index].pingFromClientToHostServer = 1000;
                    serverSetting.mySetting.pingList[index].time = 1000;
                }
            //}
        }

        IEnumerator FindNetworkExternalIP()
        {
            #region Loop through IP Address Link
            Debug.Log("TESTING123");
            float endWebReceiveWaiting = Time.realtimeSinceStartup + 3;   // 3 sec wait
            while (!MasterServer_IP_Port_Request.singleton.webAddressReceived && Time.realtimeSinceStartup < endWebReceiveWaiting)
            {
                yield return null;
            }

            int i = 0;
            while (i < MasterServer_IP_Port_Request.singleton.MS_IP_Data.ipAddressLink.Count)
            {
                WWW myExtIPWWW = new WWW(MasterServer_IP_Port_Request.singleton.MS_IP_Data.ipAddressLink[i]);
                if (myExtIPWWW.error != null)
                {
#if UNITY_EDITOR
                    Debug.Log("Address: " + MasterServer_IP_Port_Request.singleton.MS_IP_Data.ipAddressLink[i] + "Error: " + myExtIPWWW.error);
#endif
                }
                else
                {
                    yield return myExtIPWWW;
                    IPAddress ipAddress;
                    // Look for digits and dot in the string only so it will look like an IP Address.
                    string ipAddressString = Regex.Replace(myExtIPWWW.text, @"[^0-9.]", "");
                    // Check string to ensure it is NOT empty/null and is in an IP Address format.
                    if (!string.IsNullOrEmpty(ipAddressString) && IPAddress.TryParse(ipAddressString, out ipAddress))
                    {
//#if UNITY_EDITOR
                        Debug.Log(MasterServer_IP_Port_Request.singleton.MS_IP_Data.ipAddressLink[i] + "\nAddress: " + ipAddressString);
//#endif
                        serverSetting.mySetting.inputLanNet.ip = Network.player.ipAddress;
                        serverSetting.mySetting.inputLanNet.externalIp = Regex.Replace(myExtIPWWW.text, @"[^0-9.]", "");
                        break; 
                    }
                }
                i++;
            }
            #endregion

            if (i >= MasterServer_IP_Port_Request.singleton.MS_IP_Data.ipAddressLink.Count)
            {
                Debug.Log("Testing if 2nd external ip works: " + i);
                #region Code only works on 2nd run next best method if website is down.
                Network.Connect("127.0.0.1");
                //Network.InitializeServer(0, serverSetting.mySetting.inputLanNet.port, false);

                float endWaiting = Time.realtimeSinceStartup + 0.5f;   // 0.5 sec wait
                while (Network.player.externalIP == "UNASSIGNED_SYSTEM_ADDRESS" && Time.realtimeSinceStartup < endWaiting)
                {
                    yield return null;
                }
                if (Network.player.externalIP == "UNASSIGNED_SYSTEM_ADDRESS")
                {
                    RunAllFindNetworkExternalIPError();
                }

                serverSetting.mySetting.inputLanNet.ip = Network.player.ipAddress;
                serverSetting.mySetting.inputLanNet.externalIp = Network.player.externalIP;

                Network.Disconnect();
                #endregion
            }
        }

        public void RunAllPingToMasterServerDone()
        {
            var gameObjects = FindObjectsOfType(typeof(GameObject)) as GameObject[];
            foreach (var go in gameObjects)
                go.SendMessage("RA_PingToMasterServerDone", SendMessageOptions.DontRequireReceiver);
        }
        public void RA_PingToMasterServerDone() { }
        
        public void RunAllFindNetworkExternalIPError()
        {
            var gameObjects = FindObjectsOfType(typeof(GameObject)) as GameObject[];
            foreach (var go in gameObjects)
                go.SendMessage("RA_FindNetworkExternalIPError", SendMessageOptions.DontRequireReceiver);
        }
        public void RA_FindNetworkExternalIPError()
        {
            Debug.Log("Unable to obtain external ip: NAT will be used later");
        }

        public void RunAllSortLanNetDone()
        {
            var gameObjects = FindObjectsOfType(typeof(GameObject)) as GameObject[];
            foreach (var go in gameObjects)
                go.SendMessage("RA_SortLanNetDone", SendMessageOptions.DontRequireReceiver);
        }
        public void RA_SortLanNetDone()
        {
            Debug.Log("Sorting Done");
        }
        #endregion

        #region Remote Procedure Calls
        [RPC] void SendTimeScaleValue(float timeScale)
        {
            Time.timeScale = timeScale;
        }
        #endregion

        #region Methods
        public static RPCMode RPCModeCustomDecode(RPCModeCustom mode)
        {
            switch (mode)
            {
                case RPCModeCustom.All:
                    return RPCMode.All;
                case RPCModeCustom.AllBuffered:
                    return RPCMode.AllBuffered;
                case RPCModeCustom.Others:
                    return RPCMode.Others;
                case RPCModeCustom.OthersBuffered:
                    return RPCMode.OthersBuffered;
                case RPCModeCustom.Server:
                    return RPCMode.Server;
                default:
                    return RPCMode.All;
            }
        }
        public static void PreventPlayersFromJoining()
        {
            Network.maxConnections = 0;
        }
        public static void SetMaxConnectionToCurrentOpenConnections()
        {
            Network.maxConnections = -1;
        }
        #endregion

        #region Ending Game
        public void UnregisterHostOrDisconnectClient()
        {
#if UNITY_EDITOR
            Debug.Log("Disconnecting... UnregisterHostOrDisconnectClient");
#endif
            // This is needed to stop the StopCoroutine(autoRefreshSingleton) if not there will be a infinite
            // while loop cause by AutoRefreshHostListStart_Repeat() in the AutoRefreshHostListStart code.
            AutoRefreshHostListStart(false);

            // Disconnect Host or Client
            m_NetworkMigrationManager.migrationStage = MigrationStage.migrationOff;
            m_NetworkMigrationManager.disconnectionError = NetworkDisconnectionType.None;
            m_NetworkMigrationManager.StopMigration();

            Network.Disconnect();
            MasterServer.UnregisterHost();
            
            MasterServerObjectList_Other.singleton.ClearAllList();
            m_NetworkMigrationManager.ClearAllGameObjectForMigration();

            previousNetworkType = NetworkType.isNull;

            testMasterServer = TestMasterServer.notTest;
            NatProxyFalseForClientAndHostWithPublicIP();
            IsLAN = false;
            networkType = NetworkType.isNull;
            peerTypeDesired = PeerTypeDesired.none;
            playerCount = 0;
            RunAllAfterOnDisconnectedFromServer();
        }
        public void UnregisterHostOrDisconnectClient_RefreshHostList(bool trueToStartAutoRefreshHostList = true)
	    {
	        #if UNITY_EDITOR
	        Debug.Log("Disconnecting...");
	        #endif

	        // Disconnect Host or Client
			m_NetworkMigrationManager.migrationStage = MigrationStage.migrationOff;
            m_NetworkMigrationManager.disconnectionError = NetworkDisconnectionType.None;
            m_NetworkMigrationManager.StopMigration();

	        Network.Disconnect();

	        MasterServerObjectList_Other.singleton.ClearAllList();
			m_NetworkMigrationManager.ClearAllGameObjectForMigration();

            if (isLAN)
            {
                previousNetworkType = NetworkType.isLAN;
                NetworkDiscoveryCustom.singleton.StartListening(trueToStartAutoRefreshHostList);
            }
            if (networkType == NetworkType.isNET)
            {
                // Does nothing if the server is not registered or has already unregistered.
                MasterServer.UnregisterHost();
                if (testMasterServer == TestMasterServer.masterServerFound)
                {
                    previousNetworkType = NetworkType.isNET;
                    StartCoroutine(WaitToRequestHostList(trueToStartAutoRefreshHostList));
                }
                else
                {
                    testMasterServer = TestMasterServer.cancelMasterServerSearch;
                }
            }

	        NatProxyFalseForClientAndHostWithPublicIP();
	        IsLAN = false;
	        networkType = NetworkType.isNull;
			peerTypeDesired = PeerTypeDesired.none;
	        playerCount = 0;
            RunAllAfterOnDisconnectedFromServer();
	    }
        public void MigrationUnregisterHostDisconnectClient_RefreshHostList()
        {
            #if UNITY_EDITOR
            Debug.Log("Disconnecting...");
            #endif

            // Disconnect Host or Client
            //m_NetworkMigrationManager.migrationStage = MigrationStage.migrationOff;
            Network.Disconnect(1000);

            //MasterServerObjectList_Other.singleton.ClearAllList();
            //m_NetworkMigrationManager.ClearAllGameObjectForMigration();


            //if (isLAN)
            //{
            //    NetworkDiscoveryCustom.singleton.StartListening();
            //}
            if (networkType == NetworkType.isNET)
            {
                // Does nothing if the server is not registered or has already unregistered.
                MasterServer.UnregisterHost();
                if (testMasterServer == TestMasterServer.masterServerFound)
                {
                    StartCoroutine(WaitToRequestHostList(true));
                }
                else
                {
                    testMasterServer = TestMasterServer.cancelMasterServerSearch;
                }
            }

            NatProxyFalseForClientAndHostWithPublicIP();
            IsLAN = false;
            networkType = NetworkType.isNull;
            peerTypeDesired = PeerTypeDesired.none;
            playerCount = 0;
            //RunAllAfterOnDisconnectedFromServer();
        }

        void RunAllAfterOnDisconnectedFromServer()
        {
            var gameObjects = FindObjectsOfType(typeof(GameObject)) as GameObject[];
            foreach (var go in gameObjects)
                go.SendMessage("RA_AfterOnDisconnectedFromServer", SendMessageOptions.DontRequireReceiver);
        }
        void RA_AfterOnDisconnectedFromServer(){}

	    void OnApplicationQuit()
	    {
            //UnregisterHostOrDisconnectClient();
            Save_NetworkData();
	    }
	    //http://answers.unity3d.com/questions/496290/can-somebody-explain-the-onapplicationpausefocus-s.html
	    #if Mobile_Input
	    //void OnApplicationPause(bool pauseStatus)
	    //{
	    //    UnregisterHostOrDisconnectClient();
	    //}
	    //void OnApplicationFocus(bool focusStatus)
	    //{
	    //    UnregisterHostOrDisconnectClient();
	    //}
	    #endif
	    #endregion

	    #region Save, Load, Delete, Reset
	    // Work for all except WEB
	    public void Save_NetworkData()
	    {
	    #if (!(UNITY_WEBGL || UNITY_WEBPLAYER))
            #region Obselete Code
            //BinaryFormatter bf = new BinaryFormatter();
            //FileStream file = File.Create(Application.persistentDataPath + "/save_NetworkData.dat");
            //print(Application.persistentDataPath);

            //// Setting Data that will be SAVED
            //NetworkSaveData data = new NetworkSaveData();

            //// Saving Data
            //data.networkSpeedKB_LAN = serverSetting.mySetting.myLan.networkSpeedKB;
            //data.syncObjectPer10thSec_LAN = serverSetting.mySetting.myLan.syncObjectPer10thSec;
            //data.savedLan = serverSetting.mySetting.myLan.savedLan;

            //data.networkSpeedKB_NET = serverSetting.mySetting.myNet.networkSpeedKB;
            //data.syncObjectPer10thSec_NET = serverSetting.mySetting.myNet.syncObjectPer10thSec;
            //data.savedNet = serverSetting.mySetting.myNet.savedNet;

            //data.savedLocationUpdate = IPPORTConnectionData.savedLocationUpdateVersionNumber;

            //// Serializing and SAVING
            //bf.Serialize(file, data);
            //file.Close(); 
            #endregion

            #region New Code
            // Setting Data that will be SAVED
            serverSetting.networkSaveData = new NetworkSaveData();

            // Saving Data
            serverSetting.networkSaveData.networkSpeedKB_LAN = serverSetting.mySetting.myLan.networkSpeedKB;
            serverSetting.networkSaveData.syncObjectPer10thSec_LAN = serverSetting.mySetting.myLan.syncObjectPer10thSec;
            serverSetting.networkSaveData.savedLan = serverSetting.mySetting.myLan.savedLan;

            serverSetting.networkSaveData.networkSpeedKB_NET = serverSetting.mySetting.myNet.networkSpeedKB;
            serverSetting.networkSaveData.syncObjectPer10thSec_NET = serverSetting.mySetting.myNet.syncObjectPer10thSec;
            serverSetting.networkSaveData.savedNet = serverSetting.mySetting.myNet.savedNet;

            serverSetting.networkSaveData.savedLocationUpdate = MasterServer_IP_Port_Request.singleton.savedLocationUpdateVersionNumber;

            // Serializing and SAVING
            serverSetting.masterServerSaveData.SaveData(serverSetting.networkSaveData);
            #endregion
            #if UNITY_EDITOR
                Debug.Log("Save Data Done!"); 
            #endif
	    #endif
	    }
	    // Work for all except WEB
	    public void Load_NetworkData()
	    {
	    #if (!(UNITY_WEBGL || UNITY_WEBPLAYER))
            #region Obselete Code
            //if (File.Exists(Application.persistentDataPath + "/save_NetworkData.dat"))
            //{
            //    BinaryFormatter bf = new BinaryFormatter();
            //    FileStream file = File.Open(Application.persistentDataPath + "/save_NetworkData.dat", FileMode.Open);

            //    // Setting Data that will be LOADED
            //    NetworkSaveData data = (NetworkSaveData)bf.Deserialize(file);
            //    file.Close();

            //    // Loading Data
            //    serverSetting.mySetting.myLan.networkSpeedKB = data.networkSpeedKB_LAN;
            //    serverSetting.mySetting.myLan.syncObjectPer10thSec = data.syncObjectPer10thSec_LAN;
            //    serverSetting.mySetting.myLan.savedLan = data.savedLan;

            //    serverSetting.mySetting.myNet.networkSpeedKB = data.networkSpeedKB_NET;
            //    serverSetting.mySetting.myNet.syncObjectPer10thSec = data.syncObjectPer10thSec_NET;
            //    serverSetting.mySetting.myNet.savedNet = data.savedNet;

            //    IPPORTConnectionData.savedLocationUpdateVersionNumber = data.savedLocationUpdate;

            //    #if UNITY_EDITOR
            //      Debug.Log("Load Save Data Done!");
            //    #endif
            //} 
            #endregion

            #region New Code
            // Setting Data that will be LOADED
            serverSetting.networkSaveData = serverSetting.masterServerSaveData.ReadData<NetworkSaveData>();
            if (serverSetting.networkSaveData == default(NetworkSaveData))
            {
                Reset_NetworkData();
                #if UNITY_EDITOR
                    Debug.Log("Reset data since load file is missing!");
                #endif
                return;
            }
            // Loading Data
            serverSetting.mySetting.myLan.networkSpeedKB = serverSetting.networkSaveData.networkSpeedKB_LAN;
            serverSetting.mySetting.myLan.syncObjectPer10thSec = serverSetting.networkSaveData.syncObjectPer10thSec_LAN;
            serverSetting.mySetting.myLan.savedLan = serverSetting.networkSaveData.savedLan;

            serverSetting.mySetting.myNet.networkSpeedKB = serverSetting.networkSaveData.networkSpeedKB_NET;
            serverSetting.mySetting.myNet.syncObjectPer10thSec = serverSetting.networkSaveData.syncObjectPer10thSec_NET;
            serverSetting.mySetting.myNet.savedNet = serverSetting.networkSaveData.savedNet;

            MasterServer_IP_Port_Request.singleton.savedLocationUpdateVersionNumber = serverSetting.networkSaveData.savedLocationUpdate;

            #if UNITY_EDITOR
                Debug.Log("Load Save Data Done!");
            #endif
            #endregion
        #endif
        }

	    public void Delete_NetworkData()
	    {
	#if (!(UNITY_WEBGL || UNITY_WEBPLAYER))
            serverSetting.masterServerSaveData.Delete();
            #if UNITY_EDITOR
                Debug.Log("Delete Save Data File"); 
            #endif
	#endif
	    }

	    public void Reset_NetworkData()
	    {
        #if (!(UNITY_WEBGL || UNITY_WEBPLAYER))
            #region Obselete Code
            //BinaryFormatter bf = new BinaryFormatter();
            //FileStream file = File.Create(Application.persistentDataPath + "/save_NetworkData.dat");

            //// Setting Data that will be SAVED
            //NetworkSaveData data = new NetworkSaveData();

            //// Saving Data
            //data.networkSpeedKB_LAN = 0;
            //data.syncObjectPer10thSec_LAN = 100;
            //data.networkSpeedKB_NET = 0;
            //data.syncObjectPer10thSec_NET = 7;

            //data.savedLan = new LANNETData();
            //data.savedNet = new LANNETData();

            //IPPORTConnectionData.savedLocationUpdateVersionNumber = 0;

            //// Serializing and SAVING
            //bf.Serialize(file, data);
            //file.Close();

            //Load_NetworkData(); 
            #endregion

            #region New Code
            // Setting Data that will be SAVED
            serverSetting.networkSaveData = new NetworkSaveData();

            // Saving Data
            serverSetting.networkSaveData.networkSpeedKB_LAN = 0;
            serverSetting.networkSaveData.syncObjectPer10thSec_LAN = 100;
            serverSetting.networkSaveData.networkSpeedKB_NET = 0;
            serverSetting.networkSaveData.syncObjectPer10thSec_NET = 7;

            serverSetting.networkSaveData.savedLan = new LANNETData();
            serverSetting.networkSaveData.savedNet = new LANNETData();

            MasterServer_IP_Port_Request.singleton.savedLocationUpdateVersionNumber = 0;

            // Serializing and SAVING
            serverSetting.masterServerSaveData.SaveData(serverSetting.networkSaveData);
            Load_NetworkData(); 
            #endregion
        #endif
	    }
	    #endregion

	    #region Test Connection
	    //// Run Connection Test after Host Server started.
	    //string testStatus = "Testing network connection capabilities.";
	    //string testMessage = "Test in progress";
	    //string shouldEnableNatMessage  = "";
	    //bool doneTesting = false;
	    //bool probingPublicIP = false;
	    //bool tryUseNAT = false;
	    //int serverPort = 25000;  // This should be our host server port;
	    //float timer;

	    //ConnectionTesterStatus connectionTestResult = ConnectionTesterStatus.Undetermined;

	    ////void OnGUI() {
	    ////    GUILayout.Label("Current Status: " + testStatus);
	    ////    GUILayout.Label("Test result : " + testMessage);
	    ////    GUILayout.Label(shouldEnableNatMessage);

	    ////    if (!doneTesting)
	    ////        TestConnection();
	    ////}
		
	    //void TestConnection(bool forceTest = false)
	    //{
	    //    // Start/Poll the connection test, report the results in a label and 
	    //    // react to the results accordingly
	    //    connectionTestResult = Network.TestConnection(forceTest);
	    //    StartCoroutine(WaitForTestConnectionResult());
	    //}

	    //IEnumerator WaitForTestConnectionResult()
	    //{
	    //    timer = Time.time + 12;
	    //    while(!doneTesting && Time.time < timer)
	    //    {
	    //        yield return new WaitForSeconds(1);
	    //        TestConnectionResult();
	    //    }
	    //}

	    //void TestConnectionResult()
	    //{
	    //    // Start/Poll the connection test, report the results in a label and 
	    //    // react to the results accordingly
	    //    connectionTestResult = Network.TestConnection();
	    //    switch (connectionTestResult) {
	    //        case ConnectionTesterStatus.Error: 
	    //            testMessage = "Problem determining NAT capabilities";
	    //            doneTesting = true;
	    //            break;
	    				
	    //        case ConnectionTesterStatus.Undetermined: 
	    //            testMessage = "Undetermined NAT capabilities";
	    //            doneTesting = false;
	    //            break;
	    							
	    //        case ConnectionTesterStatus.PublicIPIsConnectable:
	    //            testMessage = "Directly connectable public IP address.";
	    //            tryUseNAT = false;
	    //            doneTesting = true;
	    //            break;
	    				
	    //        // This case is a bit special as we now need to check if we can 
	    //        // circumvent the blocking by using NAT punchthrough
	    //        case ConnectionTesterStatus.PublicIPPortBlocked:
	    //            testMessage = "Non-connectable public IP address (port " +
	    //                serverPort +" blocked), running a server is impossible.";
	    //            tryUseNAT = false;
	    //            // If no NAT punchthrough test has been performed on this public 
	    //            // IP, force a test
	    //            if (!probingPublicIP) {
	    //                connectionTestResult = Network.TestConnectionNAT();
	    //                probingPublicIP = true;
	    //                testStatus = "Testing if blocked public IP can be circumvented";
	    //                timer = Time.time + 10;
	    //            }
	    //            // NAT punchthrough test was performed but we still get blocked
	    //            else if (Time.time > timer) {
	    //                probingPublicIP = false; 		// reset
	    //                tryUseNAT = true;
	    //                doneTesting = true;
	    //            }
	    //            break;
	    			
	    //        case ConnectionTesterStatus.PublicIPNoServerStarted:
	    //            testMessage = "Public IP address but server not initialized, "+
	    //                "it must be started to check server accessibility. Restart "+
	    //                "connection test when ready.";
	    //            break;
	    							
	    //        case ConnectionTesterStatus.LimitedNATPunchthroughPortRestricted:
	    //            testMessage = "Limited NAT punchthrough capabilities. Cannot "+
	    //                "connect to all types of NAT servers. Running a server "+
	    //                "is ill advised as not everyone can connect.";
	    //            tryUseNAT = true;
	    //            doneTesting = true;
	    //            break;
	    				
	    //        case ConnectionTesterStatus.LimitedNATPunchthroughSymmetric:
	    //            testMessage = "Limited NAT punchthrough capabilities. Cannot "+
	    //                "connect to all types of NAT servers. Running a server "+
	    //                "is ill advised as not everyone can connect.";
	    //            tryUseNAT = true;
	    //            doneTesting = true;
	    //            break;

	    //        // Note: this CASE will fall through so it will run all code until it see a break.
	    //        case ConnectionTesterStatus.NATpunchthroughAddressRestrictedCone:
	    //        case ConnectionTesterStatus.NATpunchthroughFullCone:
	    //            testMessage = "NAT punchthrough capable. Can connect to all "+
	    //                "servers and receive connections from all clients. Enabling "+
	    //                "NAT punchthrough functionality.";
	    //            tryUseNAT = true;
	    //            doneTesting = true;
	    //            break;
	    	
	    //        default: 
	    //            testMessage = "Error in test routine, got " + connectionTestResult;
	    //            break;
	    //    }
		
	    //    if (doneTesting) {
	    //        if (tryUseNAT)
	    //            shouldEnableNatMessage = "When starting a server the NAT "+
	    //                "punchthrough feature should be enabled (useNat parameter)";
	    //        else
	    //            shouldEnableNatMessage = "NAT punchthrough not needed";
	    //        testStatus = "Done testing";
	    //    }
	    //}
	    #endregion
	}

	#region Other Class and Enum
	[System.Serializable]
	public class NetworkGameInfo
	{
	    [ReadOnly] public bool autoServerTypeSelect = false;
	    [Tooltip("AuthoritativeServer: All movement are perform by server and send to clients. SemiAuthoritativeServer: Client does its own movement and send to server to remove latency response time client might experience.")]
	    [ReadOnly] public ServerType serverType;
        public NetworkSynchronization stateSynchronization = NetworkSynchronization.Automatic;
        public bool networkInstantiateMethod;
        public bool autoInstantiatePlayer = true;
        public bool forceGame2D;
        public bool pauseOnConnectToServer;
        [Tooltip("Spawn Player when SERVER is done syncing data to CLIENT")] public bool playerSetActiveAfterDataSyncCompleted = true;
        [Tooltip("Enable Object Active/Inactive when within player's CAMERA range")] public bool cameraRangeEnable = true;
        [Tooltip("Enable Object Active/Inactive when within player's CAMERA range")] public bool cameraRangeEnableStaticObjects = true;
        [Tooltip("Index: 0 should be an invisible playerToSentTo for DEDICATED SERVER to move around.\n\nDefault: This index will be loaded from (.../Resources/NetworkObjectList")] public int playerPrefabIndex;
        [Tooltip("Default offline scene build index to load")] public int defaultOfflineSceneBuildIndex = 1;

        [Header("Player Default Spawn Point")]
        public SpawnDefinitions spawnDefinitions;

	    [Header("Scene Options")]
	    // Loading Scene Tutorial if players are transfer over: https://docs.unity3d.com/Manual/net-NetworkLevelLoad.html
	    public bool autoLoadSceneOnServerInitializeOrClientJoin = true;
		public bool setAllowSceneActivation = true;
        [Range(0f, 5f), Tooltip("Time before Player is set active")]
        public float playerSetActiveTime = 0.5f;
        [Range(0f, 5f), Tooltip("VALUE should remain at zero to disconnect instantly.\n\nNOTE: Previous \"load time\" COROUTINE need to end before Starting/Joining Server Methods be used!")]
        public float offlineLoadTime;
        [Range(0f, 10f), Tooltip("NOTE: Previous \"load time\" COROUTINE need to end before Starting/Joining Server Methods be used!")]
        public float onlineLoadTime;
        public LoadEventWindows loadSceneWaitScreen;
        public LoadEventWindows errorMessageScreen;

        [Header("Optional Setting")]
        public OptionalSetting optionalSetting;
	}
	[System.Serializable]
	public class ServerSetting
	{
        [SerializeField, Tooltip("gameUniqueID: Will be unique to distinguish this game from others.\n\n[Modify Broadcast Key in Network Discovery Custom for each game unique ID]")]
        string m_gameUniqueID = "GameUniqueID";
        [SerializeField, Tooltip("All game with different VERSION cannot connect to each others. Only same version can connect to one another."), Range(1, 2000000000)]
        int m_gameVersion = 1;
        [SerializeField, Tooltip("All game with different SUB VERSION has no noticable difference. Mostly bug fixes. (Currently not being used in the code. Only being used to keep track of sub version releases)"), Range(1, 2000000000)]
        int m_gameSubVersion = 1;
        [SerializeField, Range(0, 99999), Tooltip("Normally host updates are only sent if something in the host information has changed (like connected players). The update rate defines the minimum amount of time which may elapse between host updates. The default value is 60 seconds minimum update rate (where a check is made for changes). So if one host update is sent and then some field changes 10 seconds later then the update will possibly sent 50 seconds later (at the next change check). If this is set to 0 then no updates are sent, only initial registration information.\n https://docs.unity3d.com/ScriptReference/MasterServer-updateRate.html")]
        // https://docs.unity3d.com/ScriptReference/MasterServer-updateRate.html
        int m_MasterServerUpdateRate = 5;
        [Tooltip("Only when using NET are NAT Punchthrough and PROXY used!")]
        public ForceUseNATProxy forceUseNATProxy;
		public PortRange portRange;
        [SerializeField, Tooltip("Optional:\n(Default) Player choose their own option in game.\n\nDisable:\nDisable dedicated server option.\n\nEnable:\nEnforce server to be dedicated server.\n\nNOTE:\nDisable & Enable are usable in UNITY_EDITOR mode only! During release this option is defaulted to OPTIONAL automatically!")]
        DedicatedServerOption m_dedicatedServer;
        [SerializeField, Tooltip("Optional:\n(Default) Player choose their own option in game.\n\nDisable:\nDisable AES encryption on server.\n\nEnable:\nEnforce AES encryption on server.\n\nNOTE:\nBy adding security it will require more data transfered.")]
        InitializeSecurityOption m_initializeSecurity;

        [SerializeField, Tooltip("Max player limit for each server"), Range(2, 1000000000)]
        int m_forcePlayerLimit = 128;
        [SerializeField, Tooltip("Max player limit for proxy server"), Range(2, 1000000000)]
        int m_proxyPlayerLimit = 2;
        [SerializeField, Tooltip("Max observer limit (Proxy Server will automatically have NO observer)"), Range(0, 1000000000)]
        int m_forceObserverLimit;
        [Header("My Player Setting")]
        /*[ReadOnly] */public MySetting mySetting;
        public HostListSortingOptions sortingOption;
        [ReadOnly] public List<LANNETData> sortedHostList;
		[Header("Other LAN Setting")]
		[ReadOnly] public LAN otherLan;
		[Header("Other NET Setting")]
		[ReadOnly] public NET otherNet;

        [Header("Save Data")]
        public JsonData masterServerSaveData = new JsonData("MasterServerSaveData.dat");
        public NetworkSaveData networkSaveData;

        #region Methods
        public int MasterServerUpdateRate
        {
            get { return m_MasterServerUpdateRate; }
        }
        public void ServerSettingGameType()
        {
            mySetting.inputLanNet.gameUniqueID = m_gameUniqueID;
            mySetting.inputLanNet.gameVersion = m_gameVersion;
            mySetting.inputLanNet.gameSubVersion = m_gameSubVersion;
        }
        public int ForcePlayerLimit
        {
            get { return m_forcePlayerLimit; }
        }
        public int ProxyPlayerLimit
        {
            get { return m_proxyPlayerLimit; }
        }
        public int ForceObserverLimit
        {
            get { return m_forceObserverLimit; }
        }

        public DedicatedServerOption DedicatedServer_Option
        {
            get { return m_dedicatedServer; }
        }
        public InitializeSecurityOption InitializeSecurity_Option
        {
            get { return m_initializeSecurity; }
        }

        public string GameNameVersion
        {
            get { return GameUniqueID + "." + GameVersion; }
        }
        public string GameUniqueID
        {
            get { return m_gameUniqueID;  }
        }
        public int GameVersion
        {
            get { return m_gameVersion; }
        }
        public int GameSubVersion
        {
            get { return m_gameSubVersion; }
        }
        #endregion
	}
    [System.Serializable]
    public class MySetting
    {
        [Tooltip("Network Data: Host/Client connection data\n\nWhen hosting this dropdown show host data.\nWhen connecting as client this dropdown show client connection data.")]
        public LANNETData inputLanNet;
        public LANNETData myLanNet;
        public LANNETData hostLanNet;
        [ReadOnly] public MyLAN myLan;
        [ReadOnly] public MyNET myNet;
        [ReadOnly] public List<PingParameters> pingList;
    }
    [System.Serializable]
    public class MyLAN
    {
        [ReadOnly] public LANNETData savedLan;

        [Header("LAN Network Speed")]
	    [ReadOnly] public float networkSpeedKB;
	    [ReadOnly] public int syncObjectPer10thSec = 50;
    }
    [System.Serializable]
    public class MyNET
    {
        [ReadOnly] public LANNETData savedNet;

        [Header("NET Network Speed")]
	    [ReadOnly] public float networkSpeedKB;
	    [ReadOnly] public int syncObjectPer10thSec = 10;
    }
	[System.Serializable]
	public class LAN
	{
        [ReadOnly] public List<LANNETData> lanHostSortSearch;
        [ReadOnly] public List<LANNETData> lanHostSortABC;
        [ReadOnly] public List<LANNETData> lanHostSortABCPing;
        [ReadOnly] public List<LANNETData> lanHostSortPingABC;
        [ReadOnly] public List<LANNETData> lanHostSortCBA;
        [ReadOnly] public List<LANNETData> lanHostSortCBAPing;
        [ReadOnly] public List<LANNETData> lanHostSortPingCBA;
        //[ReadOnly] public List<LANNETData> lanHostsSorted;

        [Tooltip("Display all the servers this player (CLIENT) can join")]
        [ReadOnly] public List<LANNETData> lanHosts;
	}
	[System.Serializable]
	public class NET
	{
        [ReadOnly] public List<LANNETData> netHostSortSearch;
        [ReadOnly] public List<LANNETData> netHostSortABC;
        [ReadOnly] public List<LANNETData> netHostSortABCPing;
        [ReadOnly] public List<LANNETData> netHostSortPingABC;
        [ReadOnly] public List<LANNETData> netHostSortCBA;
        [ReadOnly] public List<LANNETData> netHostSortCBAPing;
        [ReadOnly] public List<LANNETData> netHostSortPingCBA;
        //[ReadOnly] public List<LANNETData> netHostsSorted;

        [Tooltip("Display all the servers this player (CLIENT) can join")]
        [ReadOnly] public List<LANNETData> netHosts;
        [ReadOnly] public List<Ping> hostsPing;
	}
	[System.Serializable]
	public class PortRange{
		[ReadOnly, SerializeField, Tooltip("Start Port (Inclusive)")]
		int m_startPort = 20000;
        [ReadOnly, SerializeField, Tooltip("End Port (Exclusive)")]
		int m_endPort = 60000;		// 35250;
//		[HideInInspector] public int portAmount = 30250;

        public int StartPort
        {
            get { return m_startPort; }
        }
        public int EndPort
        {
            get { return m_endPort; }
        }
	}
	[System.Serializable]
	public class NetworkSaveData{
		[ReadOnly] public float networkSpeedKB_LAN;
		[ReadOnly] public int syncObjectPer10thSec_LAN = 100;
        [ReadOnly] public float networkSpeedKB_NET;
		[ReadOnly] public int syncObjectPer10thSec_NET = 7;

        public LANNETData savedLan;
        public LANNETData savedNet;
        public int savedLocationUpdate;
        //[SerializeField, ReadOnly] string savedCountry;
        //[SerializeField, ReadOnly] string savedCity;
        //public string SavedCountry
        //{
        //    get
        //    {
        //        return savedCountry;
        //    }
        //    set
        //    {
        //        MasterServerNetworkManager.singleton.serverSetting.mySetting.inputLanNet.country = value;
        //        savedCountry = value;
        //    }
        //}
        //public string SavedCity
        //{
        //    get
        //    {
        //        return savedCity;
        //    }
        //    set
        //    {
        //        MasterServerNetworkManager.singleton.serverSetting.mySetting.inputLanNet.city = value;
        //        savedCity = value;
        //    }
        //}
	}
	[System.Serializable]
	public class MasterNATProxyServer
	{
		public List<string> masterServerIpAddresses = new List<string>() { "47.41.0.18", "47.41.0.18" };
		public List<int> masterServerPorts = new List<int>() { 1101, 1401 };
		public List<string> natFacilitatorIpAddresses = new List<string>() { "47.41.0.18", "47.41.0.18" };
		public List<int> natFacilitatorPorts = new List<int>() { 1102, 1402 };
		public List<string> proxyIpAddresses = new List<string>() { "47.41.0.18", "47.41.0.18" };
		public List<int> proxyPorts = new List<int>() { 1103, 1403 };
		//public List<string> connectionTesterIpAddresses = new List<string>() { "47.41.0.18", "47.41.0.18" };
		//public List<int> connectionTesterPorts = new List<int>() { 1104, 1404 };
	}
    [System.Serializable]
    public class LANNETData : IComparable<LANNETData>
    {
        #region Variables
        /* Most of the variables are store in the [HOST LIST's comment] or [NETWORK DISCOVERY's broadcast data]
         * to be send directly to the client for processing and decoding.
         */

        // Room Info
        [SerializeField, Tooltip("Game Room Name\n[Character Validation: Name]")]
        string m_gameName;
        [SerializeField, Tooltip("Player Display Name")]
        string m_playerDisplayName;
        [SerializeField, ReadOnly] string guid;
        [SerializeField, Range(0, 1000000000)]
        int m_minimumPlayerToStart;
        [ReadOnly, SerializeField, Tooltip("For LAN need to subtract 1 for dedicate server option in Master Server Network Manager code. (delete this comment afterward implementing it!)")]
        int m_connectedPlayers;
        [SerializeField, Range(2, 1000000000)]
        int m_playerLimit = 128;
        //[SerializeField, Tooltip("For saving only!"), Range(2, 1000000000)] int m_proxyPlayerLimit = 2;   // Not needed since we only care about proxy limit not amount!
        [ReadOnly, SerializeField, Tooltip("Number of observers (Proxy Server will automatically have NO observer)[Need to check if comment get updated continuously for observerConnected to work]")]
        int m_connectedObservers;
        [SerializeField, Range(0, 1000000000), Tooltip("Max observer limit (Proxy Server will automatically have NO observer)[Need to check if comment get updated continuously for observerLimit to work]")]
        int m_observerLimit;
        [SerializeField] bool m_isObserver;
        [SerializeField, ReadOnly, Tooltip("Display the total number of connections\n\n(Server player is not included in the count since host player is not an extra connection.)\n\n(TotalConnections = ForcePlayerLimit-1 + ObserverLimit)")]
        int m_totalConnections;
        [SerializeField, ReadOnly, Tooltip("Enter Password of server (host) here to join their network Game Room (GameName)\n[Character Validation: Alphanumeric]")]
        string m_password;
        [SerializeField, ReadOnly, Tooltip("If password is left blank there is no password for the server")]
        bool m_passwordProtected;

        // Game Type contains (game)
        [Header("Game Type decode into substring")]
        [ReadOnly, SerializeField, Tooltip("GameType = gameUniqueID + gameVersion + country + city + PrivateGame")]
        string m_gameType; // Unique Game Type for each version and game (m_gameType may be use to distinguish LOCATION)
        [ReadOnly, Tooltip("gameUniqueID = m_gameType: Will be unique to distinguish this game from another.\n\n[Modify Broadcast Key in Network Discovery Custom for each game unique ID]")]
        public string gameUniqueID;
        [ReadOnly, Tooltip("All game with different VERSION cannot connect to each others. Only same version can connect to one another.")]
        public int gameVersion;
        [ReadOnly, Tooltip("All game with different SUB VERSION has no noticable difference. Mostly bug fixes. (Currently not being used in the code. Only being used to keep track of sub version releases)")]
        public int gameSubVersion;
        [Tooltip("Only game within the same country can connect to one another. This is to reduce traffic of hostlist being send to clients.\n[Character Validation: Name]")]
        public string country;
        [Tooltip("Only game within the same city can connect to one another. This is to reduce traffic of hostlist being send to clients.\n[Character Validation: Name]")]
        public string city;
        [ReadOnly, SerializeField, Tooltip("Private room/game will be hidden from all clients except those knowing the room name\n[Character Validation: Name]")]
        string m_privateGame;

        [Header("Host IP & Port")]
        public string externalIp;
        public string ip;
        public string[] ips;
        public int port;
        [ReadOnly, Tooltip("PING: From Client to Host Server")]
        public int pingFromClientToHostServer = 1000;
        [ReadOnly] public float millisecTimer;

        [Header("Comment decode into substring")]
        [ReadOnly, SerializeField] string m_comment;
        [ReadOnly] public string migrationID;
        [ReadOnly, SerializeField] int m_networkStateSynchronizationInt = -1;
        public string level;
        public string sceneName;
        public int sceneBuildIndex = -1;
        [SerializeField] string m_hostComment;
        [ReadOnly, SerializeField, Tooltip("Initialize Security: enable AES encryption (Call on server only!) ")]
        bool m_initializeSecurity;
        [ReadOnly, SerializeField, Tooltip("Server player count is less by 1 since there is no server player for dedicate server.")]
        bool m_isDedicatedServer;
        [ReadOnly, SerializeField, Tooltip("Network is reachable via WiFi or cable.")]
        bool m_useNat;
        [ReadOnly, SerializeField, Tooltip("Network is reachable via carrier data network.")]
        bool m_useProxy;
        [ReadOnly] public string proxyIp;
        [ReadOnly] public int proxyPort;
        [ReadOnly, Tooltip("PING: To Master Server (Proxy overall PING = pingToMasterServer [HOST] + pingToMasterServer [CLIENT])")]
        public int pingToMasterServer = 1000;

        // Host List Data (CRUCIAL)
        [HideInInspector] public string m_hostDataStringLAN;
        [HideInInspector] public int hostDataIntNET;
        #endregion

        #region Methods
        public string GameName
        {
            get
            {
                if (string.IsNullOrEmpty(m_gameName))
                {
                    // Master Server GameName cannot be empty
                    m_gameName = "Room Name - " + UnityEngine.Random.Range(10000, 99999);
                }
                return m_gameName;
            }
            set
            {
                if (string.IsNullOrEmpty(value))
                {
                    m_gameName = "";
                }
                else
                {
                    //m_gameName = Regex.Replace(value, @"[^a-zA-Z0-9 ]", "");
                    m_gameName = Regex.Replace(value, @"[^A-Za-z0-9-=!@#$%^&*(),./;'\<>?{}| ]", "");   // Characters in the list are allowed.
                }
            }
        }
        public string PlayerDisplayName
        {
            get
            {
                if (string.IsNullOrEmpty(m_playerDisplayName))
                {
                    // Master Server GameName cannot be empty
                    m_playerDisplayName = "Player " + UnityEngine.Random.Range(100, 999);
                }
                return m_playerDisplayName;
            }
            set
            {
                if (string.IsNullOrEmpty(value))
                {
                    m_playerDisplayName = "";
                }
                else
                {
                    //m_playerDisplayName = Regex.Replace(value, @"[^a-zA-Z0-9 ]", "");
                    m_playerDisplayName = Regex.Replace(value, @"[^A-Za-z0-9-=!@#$%^&*(),./;'\<>?{}| ]", "");   // Characters in the list are allowed.
                }
            }
        }
        /// <summary>
        /// Use the one in MasterServerNetworkManager.singleton.UseNat
        /// </summary>
        public bool UseNat
        {
            get { return m_useNat; }
            set
            {
                MasterServerNetworkManager.singleton.SetUseNat = value;
                m_useNat = value;
            }
        }
        /// <summary>
        /// MasterServerNetworkManager.singleton.UseProxy
        /// </summary>
        public bool UseProxy
        {
            get { return m_useProxy; }
            set
            {
                MasterServerNetworkManager.singleton.SetUseProxy = value;
                m_useProxy = value;
            }
        }

        public void ClearCount()
        {
            m_connectedPlayers = 0;
            m_connectedObservers = 0;
        }
        public bool IsDedicatedServer
        {
            get
            {
#if UNITY_EDITOR
                switch (MasterServerNetworkManager.singleton.serverSetting.DedicatedServer_Option)
                {
                    case DedicatedServerOption.enable:
                        m_isDedicatedServer = true;
                        break;
                    case DedicatedServerOption.disable:
                        m_isDedicatedServer = false;
                        break;
                    default:
                        break;
                }
#endif
                return m_isDedicatedServer;
            }
            set
            {
                m_isDedicatedServer = value;
#if UNITY_EDITOR
                switch (MasterServerNetworkManager.singleton.serverSetting.DedicatedServer_Option)
                {
                    case DedicatedServerOption.enable:
                        m_isDedicatedServer = true;
                        break;
                    case DedicatedServerOption.disable:
                        m_isDedicatedServer = false;
                        break;
                    default:
                        break;
                }
#endif
                MasterServer.dedicatedServer = m_isDedicatedServer;
            }
        }
        public bool InitializeSecurity
        {
            get
            {
                switch (MasterServerNetworkManager.singleton.serverSetting.InitializeSecurity_Option)
                {
                    case InitializeSecurityOption.enable:
                        m_initializeSecurity = true;
                        break;
                    case InitializeSecurityOption.disable:
                        m_initializeSecurity = false;
                        break;
                    default:
                        break;
                }
                return m_initializeSecurity;
            }
            set
            {
                m_initializeSecurity = value;
            }
        }
        /// <summary>
        /// All UPPERCASE to simplify sending passwords to clients
        /// </summary>
        public string Password
        {
            get
            {
                if (string.IsNullOrEmpty(m_password))
                {
                    m_passwordProtected = false;
                }
                else
                {
                    m_passwordProtected = true;
                }
                return m_password;
            }
            set
            {
                // All UPPERCASE to simplify sending passwords to clients
                //m_password = value.ToUpper();
                if (string.IsNullOrEmpty(value))
                {
                    m_password = "";
                }
                else
                {
                    m_password = Regex.Replace(value, @"[^a-zA-Z0-9]", "").ToUpper();
                }
                if (string.IsNullOrEmpty(m_password))
                {
                    m_passwordProtected = false;
                }
                else
                {
                    m_passwordProtected = true;
                }
            }
        }
        public bool PasswordProtected
        {
            get
            {
                return m_passwordProtected;
            }
        }
        public int NetworkStateSynchronizationInt
        {
            get
            {
                switch (MasterServerNetworkManager.singleton.m_NetworkGameInfo.stateSynchronization)
                {
                    case NetworkSynchronization.Off:
                        m_networkStateSynchronizationInt = 0;
                        break;
                    case NetworkSynchronization.Reliable:
                        m_networkStateSynchronizationInt = 1;
                        break;
                    case NetworkSynchronization.Unreliable:
                        m_networkStateSynchronizationInt = 2;
                        break;
                    case NetworkSynchronization.Automatic:
                    default:
                        m_networkStateSynchronizationInt = -1;
                        break;
                }
                return m_networkStateSynchronizationInt;
            }
            set
            {
                MasterServerNetworkManager.singleton.m_NetworkGameInfo.stateSynchronization = (NetworkSynchronization)value;
                m_networkStateSynchronizationInt = value;
            }
        }
        public string PrivateGame
        {
            get { return m_privateGame; }
            set
            {
                if (string.IsNullOrEmpty(value))
                {
                    m_privateGame = "";
                }
                else
                {
                    m_privateGame = Regex.Replace(value, @"[^a-zA-Z0-9 ]", "");
                }
            }
        }
        public string HostComment
        {
            get { return m_hostComment; }
            set
            {
                if (string.IsNullOrEmpty(value))
                {
                    m_hostComment = "";
                }
                else
                {
                    //m_hostComment = Regex.Replace(value, @"[^a-zA-Z0-9 ]", "");
                    m_hostComment = Regex.Replace(value, @"[^A-Za-z0-9-=!@#$%^&*(),./;'\<>?{}| ]", "");   // Characters in the list are allowed.
                }
            }
        }
        #region  Player Observer Count Methods
        public bool IsObserver
        {
            get { return m_isObserver; }
            set { m_isObserver = value; }
        }

        public int MinimumPlayerToStart
        {
            get { return m_minimumPlayerToStart;}
            set { m_minimumPlayerToStart = value;}
        }
        public int ConnectedPlayers
        {
            get { return m_connectedPlayers; }
            set
            {
                if (MasterServerNetworkManager.singleton.UseProxy)
                {
                    if (value > MasterServerNetworkManager.singleton.serverSetting.ProxyPlayerLimit)
                    {
                        m_connectedPlayers = MasterServerNetworkManager.singleton.serverSetting.ProxyPlayerLimit;
                    }
                    else
                    {
                        m_connectedPlayers = value;
                    }
                }
                else
                {
                    if (value > MasterServerNetworkManager.singleton.serverSetting.ForcePlayerLimit)
                    {
                        m_connectedPlayers = MasterServerNetworkManager.singleton.serverSetting.ForcePlayerLimit;
                    }
                    else
                    {
                        m_connectedPlayers = value;
                    }
                }
                EncodeHostDataLAN();
                EncodeCommentNET();
            }
        }
        public int PlayerLimit
        {
            get { return m_playerLimit; }
            set
            {
                if (MasterServerNetworkManager.singleton.UseProxy)
                {
                    if (value > MasterServerNetworkManager.singleton.serverSetting.ProxyPlayerLimit || value < 0)
                    {
                        m_playerLimit = MasterServerNetworkManager.singleton.serverSetting.ProxyPlayerLimit;
                    }
                    else
                    {
                        m_playerLimit = value;
                    }
                }
                else
                {
                    if (value > MasterServerNetworkManager.singleton.serverSetting.ForcePlayerLimit || value < 0)
                    {
                        m_playerLimit = MasterServerNetworkManager.singleton.serverSetting.ForcePlayerLimit;
                    }
                    else
                    {
                        m_playerLimit = value;
                    }
                }
            }
        }
        public int ConnectedObservers
        {
            get { return m_connectedObservers; }
            set
            {
                if (value > MasterServerNetworkManager.singleton.serverSetting.ForceObserverLimit || value < 0)
                {
                    m_connectedObservers = MasterServerNetworkManager.singleton.serverSetting.ForceObserverLimit;
                }
                else
                {
                    m_connectedObservers = value;
                }
                EncodeHostDataLAN();
                EncodeCommentNET();
            }
        }
        public int ObserverLimit
        {
            get { return m_observerLimit; }
            set
            {
                if (value > MasterServerNetworkManager.singleton.serverSetting.ForceObserverLimit || value < 0)
                {
                    m_observerLimit = MasterServerNetworkManager.singleton.serverSetting.ForceObserverLimit;
                }
                else
                {
                    m_observerLimit = value;
                }
            }
        }
        
        public int TotalConnections
        {
            get
            {
                if (MasterServerNetworkManager.singleton.UseProxy || MasterServerNetworkManager.singleton.networkType == NetworkType.isNET)
                {
                    PlayerLimit = m_playerLimit;
                    ObserverLimit = 0;    // No Observers for NET (only LAN)
                    m_totalConnections = PlayerLimit - 1;
                }
                else
                {
                    PlayerLimit = m_playerLimit;
                    ObserverLimit = m_observerLimit;
                    m_totalConnections = PlayerLimit - 1 + ObserverLimit;
                }
                return m_totalConnections;
            }
        }
        #endregion

        public string GameType
        {
            // Encode String
            // parse string info.:       0              1           2        3        4	
            // expected format is: [gameUniqueID]:[gameVersion]:[country]:[city]:[PrivateGame]
            get
            {
                MasterServerNetworkManager.singleton.serverSetting.ServerSettingGameType();
                m_gameType =
                    gameUniqueID + ":" +
                    gameVersion + ":" +
                    country + ":" +
                    city + ":" +
                    PrivateGame;
//#if UNITY_EDITOR
//                Debug.Log(m_gameType);
//#endif
                return m_gameType;
            }
        }
        
        int temporaryInt = -1;
        #region LAN
        public string EncodeHostDataLAN()
        {
            // Encode String
            // parse string info.:      0        1           2                3                4           5     6
            // expected format is: [GameName]:[guid]:[ConnectedPlayers]:[PlayerLimit]:[m_passwordProtected]:[ip]:[port]
            // parse string info.:       7              8          9        10        11
            // expected format is: [gameUniqueID]:[gameVersion]:[country]:[city]:[PrivateGame]
            // parse string info.:       10                     11                   12        13              14			   15                   16                          17                  18            19           20          21              22               23
            // expected format is: [migrationID]:[networkStateSynchronizationInt]:[level]:[sceneName]::[sceneBuildIndex]:[HostComment]:[m_initializeSecurity=True]:[m_isDedicatedServer=True]:[useNat=True]:[useProxy=True]:[proxyIp]:[proxyPort]:[pingToMasterServer]:[externalIP]
            if (m_isDedicatedServer)
            {
                m_hostDataStringLAN =
                    GameName + ":" +
                    guid + ":" +
                    (ConnectedPlayers-1) + ":" + /*Reduce player count since it is dedicated server!*/
                    PlayerLimit + ":" +
                    m_passwordProtected + ":" +
                    ip + ":" +
                    port + ":" +
                    GameType + ":" +
                    EncodeCommentLAN();
            }
            else
            {
                m_hostDataStringLAN =
                    GameName + ":" +
                    guid + ":" +
                    ConnectedPlayers + ":" +
                    PlayerLimit + ":" +
                    m_passwordProtected + ":" +
                    ip + ":" +
                    port + ":" +
                    GameType + ":" +
                    EncodeCommentLAN();
            }

            return m_hostDataStringLAN;
        }
        public void DecodeHostDataLAN(string newHostData)
        {
            hostDataIntNET = -1;    // -1 for LAN
            // Encode String
            // parse string info.:      0        1           2                3                4           5     6
            // expected format is: [GameName]:[guid]:[ConnectedPlayers]:[PlayerLimit]:[m_passwordProtected]:[ip]:[port]
            // parse string info.:       7              8          9        10        11
            // expected format is: [gameUniqueID]:[gameVersion]:[country]:[city]:[PrivateGame]
            // parse string info.:       12                     13                  14        15              16			     17              18                         19                          20                21                22
            // expected format is: [migrationID]:[networkStateSynchronizationInt]:[level]:[sceneName]::[sceneBuildIndex]:[HostComment]:[m_initializeSecurity=True]:[m_isDedicatedServer=True]:[ConnectedObservers]:[ObserverLimit]:[MinimumPlayerToStart]
            string[] splitData = newHostData.Split(new char[] { ':' });

            // Decode LAN host data
            m_hostDataStringLAN = newHostData;
            GameName = splitData[0];
            guid     = splitData[1];
            int.TryParse(splitData[2], out m_connectedPlayers);
            int.TryParse(splitData[3], out m_playerLimit);
            //Password = "N/A - Client suppose to know it"; // Cannot use Password method here since it will reset m_passwordProtected value incorrectly.
            m_password = "N/A - Client suppose to know it";
            if (splitData[4] == "True") { m_passwordProtected = true; }// else { m_passwordProtected = false; } // This works fine
            ip       = splitData[5];
            int.TryParse(splitData[6], out port);

            // Game Type decode into substring
            gameUniqueID = splitData[7];
            int.TryParse(splitData[8], out gameVersion);
            country = splitData[9];
            city = splitData[10];
            PrivateGame = splitData[11];
            gameSubVersion = -1;

            // Comment decode into substring
            migrationID = splitData[12];
            temporaryInt = -1;
            int.TryParse(splitData[13], out temporaryInt);
            NetworkStateSynchronizationInt = temporaryInt;
            level = splitData[14];
            sceneName = splitData[15];
            int.TryParse(splitData[16], out sceneBuildIndex);
            HostComment = splitData[17];
            if (splitData[18] == "True") { m_initializeSecurity = true; }
            if (splitData[19] == "True") { m_isDedicatedServer = true; }
            int.TryParse(splitData[20], out m_connectedObservers);
            int.TryParse(splitData[21], out m_observerLimit);
            int.TryParse(splitData[22], out m_minimumPlayerToStart);
            externalIp = splitData[23];

            m_totalConnections = PlayerLimit-1 + ObserverLimit;

            //#if UNITY_EDITOR
            //Debug.Log(m_hostDataStringLAN);
            //#endif
        }
        public string EncodeCommentLAN()
        {
            // Encode String
            // parse string info.:       12                     13                  14        15              16			     17              18                         19                          20                21                22
            // expected format is: [migrationID]:[networkStateSynchronizationInt]:[level]:[sceneName]::[sceneBuildIndex]:[HostComment]:[m_initializeSecurity=True]:[m_isDedicatedServer=True]:[ConnectedObservers]:[ObserverLimit]:[MinimumPlayerToStart]:[externalIP]
            m_comment =
                migrationID + ":" +
                NetworkStateSynchronizationInt + ":" +
                level + ":" +
                sceneName + ":" +
                sceneBuildIndex + ":" +
                HostComment + ":" +
                m_initializeSecurity + ":" +
                m_isDedicatedServer + ":" +
                ConnectedObservers + ":" +
                ObserverLimit + ":" +
                MinimumPlayerToStart + ":" +
                externalIp;

//#if UNITY_EDITOR
//            Debug.Log(m_comment);
//#endif
            return m_comment;
        } // Dont Delete
        #endregion
        #region NET
        //public string EncodeHostDataNET() { }     // Not needed already encoded in gameType and comment
        public void DecodeHostDataNET(HostData newHostData, int newHostDataIndex)
        {
            hostDataIntNET = newHostDataIndex;
            GameName = newHostData.gameName;
            guid = newHostData.guid;
            // comment
            m_connectedPlayers = newHostData.connectedPlayers;
            PlayerLimit = newHostData.playerLimit;
            Password = "N/A - Client suppose to know it";
            m_passwordProtected = newHostData.passwordProtected;
            
            // Game Type decode into substring
            m_gameType = newHostData.gameType;
            DecodeGameTypeNET(m_gameType);
            gameSubVersion = -1;

            // Host IP & Port
            ip = "NET is stored in IPs";
            ips = newHostData.ip;
            port = newHostData.port;
            //pingFromClientToHostServer
            //millisecTimer

            // Comment decode into substring
            m_comment = newHostData.comment;
            DecodeCommentNET(m_comment);
        }
        public void DecodeGameTypeNET(string gameType)
        {
            // Encode String
            // parse string info.:       0              1           2        3        4	
            // expected format is: [gameUniqueID]:[gameVersion]:[country]:[city]:[PrivateGame]
            string[] splitData = gameType.Split(new char[] { ':' });

            gameUniqueID    = splitData[0];
            int.TryParse(splitData[1], out gameVersion);
            country         = splitData[2];
            city            = splitData[3];
            PrivateGame     = splitData[4];

//#if UNITY_EDITOR
//            Debug.Log(
//                gameUniqueID + ":" +
//                gameVersion + ":" +
//                country + ":" +
//                city + ":" +
//                PrivateGame
//                );
//#endif
        }
        public string EncodeCommentNET()
        {
            // Encode String
            // parse string info.:       0                      1                    2         3               4			    5                    6                          7                   8               9           10        11
            // expected format is: [migrationID]:[networkStateSynchronizationInt]:[level]:[sceneName]::[sceneBuildIndex]:[HostComment]:[m_initializeSecurity=True]:[m_isDedicatedServer=True]:[useNat=True]:[useProxy=True]:[proxyIp]:[proxyPort]
            // parse string info.:          12                    13                14                  15                16
            // expected format is: :[pingToMasterServer]:[ConnectedObservers]:[ObserverLimit]:[MinimumPlayerToStart]:[externalIP]
            m_comment =
                migrationID + ":" +
                NetworkStateSynchronizationInt + ":" +
                level + ":" +
                sceneName + ":" +
                sceneBuildIndex + ":" +
                HostComment + ":" +
                m_initializeSecurity + ":" +
                m_isDedicatedServer + ":" +
                UseNat + ":" +
                UseProxy + ":" +
                proxyIp + ":" +
                proxyPort + ":" +
                pingToMasterServer + ":" +
                ConnectedObservers + ":" +
                ObserverLimit + ":" +
                MinimumPlayerToStart + ":" +
                externalIp;

            return m_comment;
        } 
        public void DecodeCommentNET(string comment)
        {
            // Encode String
            // parse string info.:       0                      1                    2         3               4			    5                    6                          7                   8               9           10          11
            // expected format is: [migrationID]:[networkStateSynchronizationInt]:[level]:[sceneName]::[sceneBuildIndex]:[HostComment]:[m_initializeSecurity=True]:[m_isDedicatedServer=True]:[useNat=True]:[useProxy=True]:[proxyIp]:[proxyPort]
            // parse string info.:          12                    13                14                  15                16
            // expected format is: :[pingToMasterServer]:[ConnectedObservers]:[ObserverLimit]:[MinimumPlayerToStart]:[externalIP]
            string[] splitData = comment.Split(new char[] { ':' });

            migrationID = splitData[0];
            temporaryInt = -1;
            int.TryParse(splitData[1], out temporaryInt);
            NetworkStateSynchronizationInt = temporaryInt;
            level = splitData[2];
            sceneName = splitData[3];
            int.TryParse(splitData[4], out sceneBuildIndex);
            HostComment = splitData[5];
            if (splitData[6] == "True") { m_initializeSecurity = true; }
            if (splitData[7] == "True") { m_isDedicatedServer = true; }
            if (splitData[8] == "True") { UseNat = true; }
            if (splitData[9] == "True") { UseProxy = true; }
            proxyIp = splitData[10];
            int.TryParse(splitData[11], out proxyPort);
            int.TryParse(splitData[12], out pingToMasterServer);
            int.TryParse(splitData[13], out m_connectedObservers);
            int.TryParse(splitData[14], out m_observerLimit);
            int.TryParse(splitData[15], out m_minimumPlayerToStart);
            externalIp = splitData[16];

//#if UNITY_EDITOR
//            Debug.Log(
//                migrationID + ":" +
//                networkStateSynchronizationInt + ":" +
//                level + ":" +
//                sceneName + ":" +
//                sceneBuildIndex + ":" +
//                HostComment + ":" +
//                m_initializeSecurity + ":" +
//                m_isDedicatedServer + ":" +
//                useNat + ":" +
//                useProxy + ":" +
//                proxyIp + ":" +
//                proxyPort + ":" +
//                pingToMasterServer + ":" +
//                ConnectedObservers + ":" +
//                ObserverLimit);
//#endif
        }
        #endregion
        #endregion

        #region Sorting Class
        // Reference Materials: https://visualstudiomagazine.com/articles/2011/10/01/multilevel-sorting-with-icomparable-and-icomparer.aspx
        // Sort by Ping then GameName ABC
        public int CompareTo(LANNETData other)
        {
            if (this.pingFromClientToHostServer > other.pingFromClientToHostServer)
                return 1;
            else if (this.pingFromClientToHostServer == other.pingFromClientToHostServer && String.Compare(this.GameName, other.GameName) > 0)
                return 1;
            else if (this.pingFromClientToHostServer == other.pingFromClientToHostServer && String.Compare(this.GameName, other.GameName) == 0)
                return 0;
            else
                return -1;
        }

        #region Search (Very Efficient) Can be combine with those other sort methods
        public static void Search(string searchString, List<LANNETData> listToSearch, List<LANNETData> searchList)
        {
            searchList.Clear();
            for (int i = 0; i < listToSearch.Count; i++)
            {
                if (listToSearch[i].GameName.Contains(searchString))
                {
                    searchList.Add(listToSearch[i]);
                }
            }
        }

        public void SpecialSortOption(List<LANNETData> listToSearch)
        {
            if (!MasterServerNetworkManager.singleton.serverSetting.sortingOption.sortIgnorePassword)
            {
                if (MasterServerNetworkManager.singleton.serverSetting.sortingOption.sortListWithPassword)
                {
                    MasterServerNetworkManager.singleton.serverSetting.sortedHostList = ServerWithPasswordList(listToSearch);
                }
                else
                {
                    MasterServerNetworkManager.singleton.serverSetting.sortedHostList = ServerWithoutPasswordList(listToSearch);
                }
            }
            listToSearch = MasterServerNetworkManager.singleton.serverSetting.sortedHostList;
            if (!MasterServerNetworkManager.singleton.serverSetting.sortingOption.sortIgnorePlayerLimitReach)
            {
                if (MasterServerNetworkManager.singleton.serverSetting.sortingOption.sortPlayerLimitReach)
                {
                    MasterServerNetworkManager.singleton.serverSetting.sortedHostList = ServerWithPlayerLimitReach(listToSearch);
                }
                else
                {
                    MasterServerNetworkManager.singleton.serverSetting.sortedHostList = ServerWithPlayerLimitNotReach(listToSearch);
                }
            }
        }
        public static List<LANNETData> ServerWithPasswordList(List<LANNETData> listToSearch, List<LANNETData> passwordList = null)
        {
            passwordList = new List<LANNETData>(listToSearch);
            for (int i = passwordList.Count - 1; i >= 0; i--)
            {
                if (!passwordList[i].PasswordProtected)
                {
                    passwordList.RemoveAt(i);
                }
            }
            return passwordList;
        }
        public static List<LANNETData> ServerWithoutPasswordList(List<LANNETData> listToSearch, List<LANNETData> noPasswordList = null)
        {
            noPasswordList = new List<LANNETData>(listToSearch);
            for (int i = noPasswordList.Count - 1; i >= 0; i--)
            {
                if (noPasswordList[i].PasswordProtected)
                {
                    noPasswordList.RemoveAt(i);
                }
            }
            return noPasswordList;
        }
        public static List<LANNETData> ServerWithPlayerLimitReach(List<LANNETData> listToSearch, List<LANNETData> playerLimitNotReachList = null)
        {
            playerLimitNotReachList = new List<LANNETData>(listToSearch);
            for (int i = playerLimitNotReachList.Count - 1; i >= 0; i--)
            {
                if (playerLimitNotReachList[i].m_connectedPlayers < playerLimitNotReachList[i].PlayerLimit)
                {
                    playerLimitNotReachList.RemoveAt(i);
                }
            }
            return playerLimitNotReachList;
        }
        public static List<LANNETData> ServerWithPlayerLimitNotReach(List<LANNETData> listToSearch, List<LANNETData> playerLimitNotReachList = null)
        {
            playerLimitNotReachList = new List<LANNETData>(listToSearch);
            for (int i = playerLimitNotReachList.Count - 1; i >= 0; i--)
            {
                if (playerLimitNotReachList[i].m_connectedPlayers >= playerLimitNotReachList[i].PlayerLimit)
                {
                    playerLimitNotReachList.RemoveAt(i);
                }
            }
            return playerLimitNotReachList;
        }
        #endregion

        #region More Sorting Options (Sorting base on int is the most efficient)
        public class SortMethods
        {
            public class SortByGamenameAscending : IComparer<LANNETData>
            {
                public int Compare(LANNETData c1, LANNETData c2)
                {
                    return string.Compare(c1.GameName, c2.GameName);
                }
            }
            public class SortByGamenameDescending : IComparer<LANNETData>
            {
                public int Compare(LANNETData c1, LANNETData c2)
                {
                    return -1 * string.Compare(c1.GameName, c2.GameName);
                }
            }
            public class SortByPingGamenameAscending : IComparer<LANNETData>
            {
                public int Compare(LANNETData c1, LANNETData c2)
                {
                    if (c1.pingFromClientToHostServer > c2.pingFromClientToHostServer)
                        return 1;
                    else if (c1.pingFromClientToHostServer == c2.pingFromClientToHostServer && String.Compare(c1.GameName, c2.GameName) > 0)
                        return 1;
                    else if (c1.pingFromClientToHostServer == c2.pingFromClientToHostServer && String.Compare(c1.GameName, c2.GameName) == 0)
                        return 0;
                    else
                        return -1;
                }
            }
            public class SortByPingGamenameDescending : IComparer<LANNETData>
            {
                public int Compare(LANNETData c1, LANNETData c2)
                {
                    if (c1.pingFromClientToHostServer > c2.pingFromClientToHostServer)
                        return -1;
                    else if (c1.pingFromClientToHostServer == c2.pingFromClientToHostServer && String.Compare(c1.GameName, c2.GameName) > 0)
                        return -1;
                    else if (c1.pingFromClientToHostServer == c2.pingFromClientToHostServer && String.Compare(c1.GameName, c2.GameName) == 0)
                        return 0;
                    else
                        return 1;
                }
            }
            public class SortByGamenamePingAscending : IComparer<LANNETData>
            {
                public int Compare(LANNETData c1, LANNETData c2)
                {
                    if (String.Compare(c1.GameName, c2.GameName) > 0)
                        return 1;
                    else if (String.Compare(c1.GameName, c2.GameName) == 0 && c1.pingFromClientToHostServer > c2.pingFromClientToHostServer)
                        return 1;
                    else if (String.Compare(c1.GameName, c2.GameName) == 0 && c1.pingFromClientToHostServer == c2.pingFromClientToHostServer)
                        return 0;
                    else
                        return -1;
                }
            }
            public class SortByGamenamePingDescending : IComparer<LANNETData>
            {
                public int Compare(LANNETData c1, LANNETData c2)
                {
                    if (String.Compare(c1.GameName, c2.GameName) > 0)
                        return -1;
                    else if (String.Compare(c1.GameName, c2.GameName) == 0 && c1.pingFromClientToHostServer > c2.pingFromClientToHostServer)
                        return -1;
                    else if (String.Compare(c1.GameName, c2.GameName) == 0 && c1.pingFromClientToHostServer == c2.pingFromClientToHostServer)
                        return 0;
                    else
                        return 1;
                }
            }
        }
        #endregion
        #endregion
    }
    [System.Serializable]
    public class LocalPorts
    {
        [Range(1, 65535)] public int masterServerPort = 1101;
        [Range(1, 65535)] public int facilitatorServerPort = 1102;
        [Range(1, 65535)] public int proxyServerPort = 1103;
    }
    [System.Serializable]
    public class CPU_Load
    {
        public int loadNumber = 100;
    }
    [System.Serializable]
    public class PlayerObserverDetails
    {

    }
    [System.Serializable]
    public class OptionalSetting
    {
        [Tooltip("readyToStart boolean that need to be set to true before game begins")]
        public bool allReadyOption = true;
        [Tooltip("(TRUE) Player automatically start if they were ready before migration.\n\n(FALSE) Player have to set readyToStart boolean to true during each migration")]
        public bool alwaysReadyDuringMigration = true;
        public PlayerDetailsSort playerDetailsSort;
        [ReadOnly] public bool myPlayerReadyBeforeMigration;
        [ReadOnly] public bool allPlayerReadyPreviously;
        [ReadOnly] public bool receivedAllPlayerDetails;
        [ReadOnly] public int numberOfPlayerReady;
        [Range(8, 100), Tooltip("Default: 8\n1 byte per char in a string")]public int playerIDLength = 35;
        public PlayerBasicDetails myPlayerReadyDetail;
        [ReadOnly] public List<PlayerBasicDetails> playerReadyDetailList;
    }
    [System.Serializable]
    public class PlayerBasicDetails : IComparable<PlayerBasicDetails>
    {
        /*[ReadOnly]*/ public string playerName;
        public NetworkPlayer networkPlayer;
        [ReadOnly] public int playerNumber;
        [ReadOnly] public string playerID;
        [ReadOnly] public bool readyToStart;
        [ReadOnly] public bool isObserver;
        [ReadOnly] public int playerKill;
        [ReadOnly] public int score;
        [ReadOnly] public int level = 1;
        [ReadOnly] public GameObject playerObject;

        public PlayerBasicDetails(NetworkPlayer network_Player, string player_ID = "", bool isReady = false, bool observer = false, string name = "", int killCount = 0, int scoreValue = 0, int levelValue = 1)
        {
            networkPlayer = network_Player;
            readyToStart = isReady;
            isObserver = observer;
            if (string.IsNullOrEmpty(player_ID))
            {
                playerID = CreateRandomPlayerID_62Char(MasterServerNetworkManager.singleton.m_NetworkGameInfo.optionalSetting.playerIDLength);
            }
            else
            {
                playerID = player_ID;
            }
            int.TryParse(network_Player.ToString(), out playerNumber);
            if (string.IsNullOrEmpty(name))
            {
                playerName = "PlayerID-" + CreateRandomPlayerID_36Char(3);
            }
            else
            {
                playerName = name;
            }
            playerKill = killCount;
            score = scoreValue;
            level = levelValue;
        }
        public static string CreateRandomPlayerID_36Char(int lengthID)
        {
            string acceptableChar = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            int length = acceptableChar.Length;
            string hostID = "";
            for (int i = 0; i < lengthID; i++)
            {
                hostID += acceptableChar[UnityEngine.Random.Range(0, length)];
            }
            return hostID;
        }
        public static string CreateRandomPlayerID_62Char(int lengthID)
        {
            string acceptableChar = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
            int length = acceptableChar.Length;
            string hostID = "";
            for (int i = 0; i < lengthID; i++)
            {
                hostID += acceptableChar[UnityEngine.Random.Range(0, length)];
            }
            return hostID;
        }

        #region Sorting Class
        // Reference Materials: https://visualstudiomagazine.com/articles/2011/10/01/multilevel-sorting-with-icomparable-and-icomparer.aspx
        /// <summary>
        /// Sort by Player_Kill then Score
        /// </summary>
        /// <param name="other"></param>
        /// <returns></returns>
        public int CompareTo(PlayerBasicDetails other)
        {
            if (this.playerKill > other.playerKill)
                return 1;
            else if (this.playerKill == other.playerKill && this.score > other.score)
                return 1;
            else if (this.playerKill == other.playerKill && this.score == other.score && String.Compare(this.playerName, other.playerName) < 0)
                return 1;
            else if (this.playerKill == other.playerKill && this.score == other.score && String.Compare(this.playerName, other.playerName) == 0 && this.level < other.level)
                return 1;
            else if (this.playerKill == other.playerKill && this.score == other.score && String.Compare(this.playerName, other.playerName) == 0 && this.level == other.level)
                return 0;
            else
                return -1;
        }

        #region Search (Very Efficient) Can be combine with those other sort methods
        public static void Search(string searchString, List<PlayerBasicDetails> listToSearch, List<PlayerBasicDetails> searchList)
        {
            searchList.Clear();
            for (int i = 0; i < listToSearch.Count; i++)
            {
                if (listToSearch[i].playerName.Contains(searchString))
                {
                    searchList.Add(listToSearch[i]);
                }
            }
        }
        #endregion

        #region More Sorting Options (Sorting base on int is the most efficient)
        public class SortMethods
        {
            public class SortByPlayerKillScorePlayerNameLevel_321 : IComparer<PlayerBasicDetails>
            {
                public int Compare(PlayerBasicDetails c1, PlayerBasicDetails c2)
                {
                    if (c1.playerKill > c2.playerKill)
                        return -1;
                    else if (c1.playerKill == c2.playerKill && c1.score > c2.score)
                        return -1;
                    else if (c1.playerKill == c2.playerKill && c1.score == c2.score && String.Compare(c1.playerName, c2.playerName) < 0)
                        return -1;
                    else if (c1.playerKill == c2.playerKill && c1.score == c2.score && String.Compare(c1.playerName, c2.playerName) == 0 && c1.level < c2.level)
                        return -1;
                    else if (c1.playerKill == c2.playerKill && c1.score == c2.score && String.Compare(c1.playerName, c2.playerName) == 0 && c1.level == c2.level)
                        return 0;
                    else
                        return 1;
                }
            }
            public class SortByPlayerName_Ascending : IComparer<PlayerBasicDetails>
            {
                public int Compare(PlayerBasicDetails c1, PlayerBasicDetails c2)
                {
                    return string.Compare(c1.playerName, c2.playerName);
                }
            }
            public class SortByPlayerName_Descending : IComparer<PlayerBasicDetails>
            {
                public int Compare(PlayerBasicDetails c1, PlayerBasicDetails c2)
                {
                    return -1 * string.Compare(c1.playerName, c2.playerName);
                }
            }
            public class SortByScorePlayerKillPlayerNameLevel_123 : IComparer<PlayerBasicDetails>
            {
                public int Compare(PlayerBasicDetails c1, PlayerBasicDetails c2)
                {
                    if (c1.score > c2.score)
                        return 1;
                    else if (c1.score == c2.score && c1.playerKill > c2.playerKill)
                        return 1;
                    else if (c1.score == c2.score && c1.playerKill == c2.playerKill && String.Compare(c1.playerName, c2.playerName) < 0)
                        return 1;
                    else if (c1.score == c2.score && c1.playerKill == c2.playerKill && String.Compare(c1.playerName, c2.playerName) == 0 && c1.level < c2.level)
                        return 1;
                    else if (c1.score == c2.score && c1.playerKill == c2.playerKill && String.Compare(c1.playerName, c2.playerName) == 0 && c1.level == c2.level)
                        return 0;
                    else
                        return -1;
                }
            }
            public class SortByScorePlayerKillPlayerNameLevel_321 : IComparer<PlayerBasicDetails>
            {
                public int Compare(PlayerBasicDetails c1, PlayerBasicDetails c2)
                {
                    if (c1.score > c2.score)
                        return -1;
                    else if (c1.score == c2.score && c1.playerKill > c2.playerKill)
                        return -1;
                    else if (c1.score == c2.score && c1.playerKill == c2.playerKill && String.Compare(c1.playerName, c2.playerName) < 0)
                        return -1;
                    else if (c1.score == c2.score && c1.playerKill == c2.playerKill && String.Compare(c1.playerName, c2.playerName) == 0 && c1.level < c2.level)
                        return -1;
                    else if (c1.score == c2.score && c1.playerKill == c2.playerKill && String.Compare(c1.playerName, c2.playerName) == 0 && c1.level == c2.level)
                        return 0;
                    else
                        return 1;
                }
            }
            /// <summary>
            /// Avoid string comparision to reduce CPU Load
            /// </summary>
            public class SortByPlayerNamePlayerKillScoreLevel_Ascending : IComparer<PlayerBasicDetails>
            {
                public int Compare(PlayerBasicDetails c1, PlayerBasicDetails c2)
                {
                    if (String.Compare(c1.playerName, c2.playerName) > 0)
                        return 1;
                    else if (String.Compare(c1.playerName, c2.playerName) == 0 && c1.playerKill < c2.playerKill)
                        return 1;
                    else if (String.Compare(c1.playerName, c2.playerName) == 0 && c1.playerKill == c2.playerKill && c1.score < c2.score)
                        return 1;
                    else if (String.Compare(c1.playerName, c2.playerName) == 0 && c1.playerKill == c2.playerKill && c1.score == c2.score && c1.level > c2.level)
                        return 1;
                    else if (String.Compare(c1.playerName, c2.playerName) == 0 && c1.playerKill == c2.playerKill && c1.score == c2.score && c1.level == c2.level)
                        return 0;
                    else
                        return -1;
                }
            }
            /// <summary>
            /// Avoid string comparision to reduce CPU Load
            /// </summary>
            public class SortByPlayerNamePlayerKillScoreLevel_Descending : IComparer<PlayerBasicDetails>
            {
                public int Compare(PlayerBasicDetails c1, PlayerBasicDetails c2)
                {
                    if (String.Compare(c1.playerName, c2.playerName) < 0)
                        return -1;
                    else if (String.Compare(c1.playerName, c2.playerName) == 0 && c1.playerKill < c2.playerKill)
                        return -1;
                    else if (String.Compare(c1.playerName, c2.playerName) == 0 && c1.playerKill == c2.playerKill && c1.score < c2.score)
                        return -1;
                    else if (String.Compare(c1.playerName, c2.playerName) == 0 && c1.playerKill == c2.playerKill && c1.score == c2.score && c1.level > c2.level)
                        return -1;
                    else if (String.Compare(c1.playerName, c2.playerName) == 0 && c1.playerKill == c2.playerKill && c1.score == c2.score && c1.level == c2.level)
                        return 0;
                    else
                        return 1;
                }
            }
            public class SortByLevelPlayerKillScorePlayerName_123 : IComparer<PlayerBasicDetails>
            {
                public int Compare(PlayerBasicDetails c1, PlayerBasicDetails c2)
                {
                    if (c1.level > c2.level)
                        return 1;
                    else if (c1.level == c2.level && c1.playerKill < c2.playerKill)
                        return 1;
                    else if (c1.level == c2.level && c1.playerKill == c2.playerKill && c1.score < c2.score)
                        return 1;
                    else if (c1.level == c2.level && c1.playerKill == c2.playerKill && c1.score == c2.score && String.Compare(c1.playerName, c2.playerName) > 0)
                        return 1;
                    else if (c1.level == c2.level && c1.playerKill == c2.playerKill && c1.score == c2.score && String.Compare(c1.playerName, c2.playerName) == 0)
                        return 0;
                    else
                        return -1;
                }
            }
            public class SortByLevelPlayerKillScorePlayerName_321 : IComparer<PlayerBasicDetails>
            {
                public int Compare(PlayerBasicDetails c1, PlayerBasicDetails c2)
                {
                    if (c1.level > c2.level)
                        return -1;
                    else if (c1.level == c2.level && c1.playerKill < c2.playerKill)
                        return -1;
                    else if (c1.level == c2.level && c1.playerKill == c2.playerKill && c1.score < c2.score)
                        return -1;
                    else if (c1.level == c2.level && c1.playerKill == c2.playerKill && c1.score == c2.score && String.Compare(c1.playerName, c2.playerName) > 0)
                        return -1;
                    else if (c1.level == c2.level && c1.playerKill == c2.playerKill && c1.score == c2.score && String.Compare(c1.playerName, c2.playerName) == 0)
                        return 0;
                    else
                        return 1;
                }
            }
        }
        #endregion
        #endregion
    }
    [System.Serializable]
    public class PingParameters
    {
        public Ping ping;
        public string ip;
        public bool isDone;
        public int time;

        public PingParameters(Ping ping_)
        {
            ping = ping_;
            ip = ping_.ip;
            isDone = ping_.isDone;
            time = ping_.time;
        }
        public void SetPingParameters(Ping ping_)
        {
            ping = ping_;
            ip = ping_.ip;
            isDone = ping_.isDone;
            time = ping_.time;
        }
    }
    [System.Serializable]
    public class HostListSortingOptions
    {
        [Tooltip("Sorted Host List will be refresh every 1.5sec (default)")] public bool autoRefreshHostListLAN = true;
        [Tooltip("Sorted Host List will be refresh every 5.0sec (default)")] public bool autoRefreshHostListNET = true;
        [Tooltip("Refresh Rate"), Range(1.5f, 10f)] public float autoRefreshRateLAN = 1.5f;
        [Tooltip("Refresh Rate\nMaster Server bandwidth may not support the necessary data rate for >500 host servers"), Range(1.5f, 60f)] public float autoRefreshRateNET = 5;
        [Tooltip("All options work on Net but PING does not work with Lan (Can be fixed if explored but not crucial)")] public HostListSort sortHostList;
        public string hostListSearchValue;
        [Tooltip("If TRUE will ignore if server has a password")] public bool sortIgnorePassword = true;
        [Tooltip("If FALSE sort list does not have password")] public bool sortListWithPassword;
        [Tooltip("If TRUE will ignore if player limit is reach")] public bool sortIgnorePlayerLimitReach = true;
        [Tooltip("If TRUE will show server with max out player limit")] public bool sortPlayerLimitReach;
    }

    public enum NetworkSynchronization
    {
        Automatic = -1,
        Off = 0,
        Reliable = 1,
        Unreliable = 2
    }
	public enum ServerType
	{
		// Client control local playerToSentTo and send data to server.
		SemiAuthoritativeServer,
		// All data client input are send to server and server will perform the movement before sending it back to the client.
		AuthoritativeServer
	}
	public enum NetworkType
	{
		isNull,
		isLAN,
		isNET,
        //isProxy,
        //isNAT,
        //isWIFI,
        //isMobileNET,
        //isNETwithHostMigration
	}
	public enum ForceUseNATProxy
	{
		autoSelect,
		forceUseNAT,
		forceUseProxy
	}
	public enum PeerTypeDesired
	{
		none,
		isClient,
		isServer,
	}
    public enum TestMasterServer
    {
        notTest,
        testing,
        masterServerFound,
        masterServerNotFound,
        cancelMasterServerSearch,
        allMasterServerUnavailable
    }
    public enum HostListSort
    {
        Search,
        ABC,
        ABCThenPing,
        PingThenABC,
        CBA,
        CBAThenPing,
        PingThenCBA,
        none
    }
    public enum DedicatedServerOption
    {
        optional,
        disable,
        enable,
    }
    public enum InitializeSecurityOption
    {
        optional,
        disable,
        enable,
    }
    public enum UseNetworkDiscoveryCustom
    {
        useNetworkDiscovery,
        testNetworkDiscovery,
        none
    }
    public enum PlayerDetailsSort
    {
        SortByPlayerKillScorePlayerNameLevel321 = 0,
        SortByPlayerKillScorePlayerNameLevel123 = 1,
        SortByPlayerNameAscending = 2,
        SortByPlayerNameDescending = 3,
        SortByScorePlayerKillPlayerNameLevel123 = 4,
        SortByScorePlayerKillPlayerNameLevel321 = 5,
        SortByPlayerNamePlayerKillScoreLevelAscending = 6,
        SortByPlayerNamePlayerKillScoreLevelDescending = 7,
        SortByLevelPlayerKillScorePlayerName123 = 8,
        SortByLevelPlayerKillScorePlayerName321 = 9,
        Search = 10
    }
    public enum RPCModeCustom
    {
        All = 0,
        AllBuffered = 1,
        Others = 2,
        OthersBuffered = 3,
        Server = 4,
        NetworkPlayer = 5
    }
	#endregion
}
