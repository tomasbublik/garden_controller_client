package cz.bublik.garden.lights.flutterapp

import cz.bublik.garden.lights.api.NetworkController
import cz.bublik.garden.lights.api.NetworkControllerInterface
import cz.bublik.garden.lights.api.UiListener


class FlutterUiListener: UiListener {
    override fun onUpdateIpsList(outcome: Map<String, String>) {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun onCleanIpsList() {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    fun getIpArrayAdapter() {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun onSuccess() {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun onAlreadyActivated() {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun onFailure(networkController: NetworkControllerInterface) {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    override fun setToggleButtonListener(networkController: NetworkController) {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

}