package br.com.multicloud.modal;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Objects;

public class CategoriaPadrao implements Serializable{

	private static final long serialVersionUID = 5554328306966819593L;

	private Long id_categoria_padrao;
	private String categoria_padrao;
	private LocalDateTime dt_criacao;
	private String obs;
	
	public LocalDateTime getDt_criacao() {
		return dt_criacao;
	}

	public void setDt_criacao(LocalDateTime dt_criacao) {
		this.dt_criacao = dt_criacao;
	}

	public Long getId_categoria_padrao() {
		return id_categoria_padrao;
	}

	public void setId_categoria_padrao(Long id_categoria_padrao) {
		this.id_categoria_padrao = id_categoria_padrao;
	}

	public String getCategoria_padrao() {
		return categoria_padrao;
	}

	public void setCategoria_padrao(String categoria_padrao) {
		this.categoria_padrao = categoria_padrao;
	}

	public String getObs() {
		return obs;
	}

	public void setObs(String obs) {
		this.obs = obs;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id_categoria_padrao);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CategoriaPadrao other = (CategoriaPadrao) obj;
		return Objects.equals(id_categoria_padrao, other.id_categoria_padrao);
	}

	@Override
	public String toString() {
		return "CategoriaPadrao [id_categoria_padrao=" + id_categoria_padrao + ", categoria_padrao=" + categoria_padrao
				+ ", dt_criacao=" + dt_criacao + ", obs=" + obs + "]";
	}
}
