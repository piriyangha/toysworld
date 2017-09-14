<?xml version="1.0" encoding="UTF-8"?>
<flow xmlns="http://www.springframework.org/schema/webflow"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/webflow
                          http://www.springframework.org/schema/webflow/spring-webflow.xsd">

	<var name="billingAddress" class="com.niit.model.BillingAddress" />

	<input name="userId" />

	<on-start>
		<evaluate expression="flowHandler.initHandler(userId)"
			result="billingAddress"></evaluate>
	</on-start>

	<view-state id="start" view="billingAddress" model="billingAddress">
		<transition on="submit" to="submit_billing" />
	</view-state>
	<action-state id="submit_billing">

		<evaluate expression="flowHandler.saveBillAddress(billingAddress)" />
		<transition to="thankYou" />

	</action-state>

	<view-state id="thankYou" view="thankYou">

	</view-state>
</flow>