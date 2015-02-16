package com.gsma.services.rcs.ipcall;

import com.gsma.services.rcs.IRcsServiceRegistrationListener;
import com.gsma.services.rcs.ipcall.IIPCall;
import com.gsma.services.rcs.ipcall.IIPCallListener;
import com.gsma.services.rcs.ipcall.IIPCallPlayer;
import com.gsma.services.rcs.ipcall.IIPCallRenderer;
import com.gsma.services.rcs.ipcall.IIPCallServiceConfiguration;
import com.gsma.services.rcs.contacts.ContactId;
import com.gsma.services.rcs.ICommonServiceConfiguration;
import com.gsma.services.rcs.RcsServiceRegistration;

/**
 * IP call service API
 */
interface IIPCallService {

	boolean isServiceRegistered();
	
	RcsServiceRegistration.ReasonCode getServiceRegistrationReasonCode();

	void addEventListener(IRcsServiceRegistrationListener listener);

	void removeEventListener(IRcsServiceRegistrationListener listener);

	IIPCallServiceConfiguration getConfiguration();

	List<IBinder> getIPCalls();
	
	IIPCall getIPCall(in String callId);

	IIPCall initiateCall(in ContactId contact, in IIPCallPlayer player, in IIPCallRenderer renderer);
	
	IIPCall initiateVisioCall(in ContactId contact, in IIPCallPlayer player, in IIPCallRenderer renderer);

	void addEventListener2(in IIPCallListener listener);

	void removeEventListener2(in IIPCallListener listener);
	
	int getServiceVersion();
	
	ICommonServiceConfiguration getCommonConfiguration();
}