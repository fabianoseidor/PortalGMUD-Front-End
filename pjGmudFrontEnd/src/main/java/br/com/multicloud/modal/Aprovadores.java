package br.com.multicloud.modal;

import java.io.Serializable;

public class Aprovadores implements Serializable{
	private static final long serialVersionUID = 4530816119170670229L;

	private Long idAprovadores;
	private String aprovador;
	private String email;
	private String obs;
	
	public Long getIdAprovadores() {
		return idAprovadores;
	}

	public void setIdAprovadores(Long idAprovadores) {
		this.idAprovadores = idAprovadores;
	}

	public String getAprovador() {
		return aprovador;
	}

	public void setAprovador(String aprovador) {
		this.aprovador = aprovador;
	}

	public String getObs() {
		return obs;
	}

	public void setObs(String obs) {
		this.obs = obs;
	}

	
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Aprovadores [idAprovadores=" + idAprovadores + ", aprovador=" + aprovador + ", obs=" + obs + "]";
	}
	
}
