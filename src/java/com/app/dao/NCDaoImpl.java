/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.dao;

import com.app.model.Appartenere;
import com.app.model.Dipendenti;
import com.app.model.NC;
import com.app.model.Responsabilita;
import com.app.objects.RepartoProdotto;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author roman
 */
@Transactional
@Repository("NCDao")
public class NCDaoImpl implements NCDao {

    @Autowired
    private SessionFactory sessionFactory;

    protected Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public NC findById(int id) {
        return (NC) getSession().get(NC.class, id);
    }

    @Override
    public List<NC> findSegnalazioni() {
        return getSession().createCriteria(NC.class).add(Restrictions.eq("enabled", 0)).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
    }

    @Override
    public void saveOrUpdateNC(NC nc) {
        getSession().saveOrUpdate(nc);
    }

    @Override
    public void deleteNC(int id) {
        NC nc = (NC) getSession().load(NC.class, id);
        if (nc != null) {
            getSession().delete(nc);
        }
    }

    @Override
    public List<NC> findNCResponsabileById(int id) {
        List<NC> nc = new ArrayList<NC>();
        Criteria criteria1 = getSession().createCriteria(Dipendenti.class).add(Restrictions.eq("matricola", id));
        if (criteria1.list().isEmpty()) {
            return nc;
        }
        Dipendenti dipNC = (Dipendenti) criteria1.uniqueResult();
        Criteria criteria2 = getSession().createCriteria(Responsabilita.class).add(Restrictions.eq("pkResponsabilita.responsabile", dipNC));
        List<Responsabilita> resp = criteria2.list();
        if (resp.isEmpty()) {
            return nc;
        }
        Criteria criteria3;
        for (Responsabilita r : resp) {
            List<NC> lista = getSession().createCriteria(NC.class).add(Restrictions.eq("numeroNC", r.getNc().getNumeroNC())).add(Restrictions.eq("enabled", 1)).list();
            if (!lista.isEmpty()) {
                nc.add(lista.get(0));
            }
        }
        return nc;
    }

    @Override
    public List<NC> findNCAppartenereById(int id) {
        List<NC> nc = new ArrayList<NC>();
        Criteria criteria1 = getSession().createCriteria(Dipendenti.class).add(Restrictions.eq("matricola", id));
        if (criteria1.list().isEmpty()) {
            return nc;
        }
        Dipendenti dipNC = (Dipendenti) criteria1.uniqueResult();
        Criteria criteria2 = getSession().createCriteria(Appartenere.class).add(Restrictions.eq("pkAppartenere.membro", dipNC));
        List<Appartenere> resp = criteria2.list();
        if (resp.isEmpty()) {
            return nc;
        }
        Criteria criteria3;
        for (Appartenere r : resp) {
            List<NC> lista = getSession().createCriteria(NC.class).add(Restrictions.eq("numeroNC", r.getNc().getNumeroNC())).add(Restrictions.eq("enabled", 1)).list();
            if (!lista.isEmpty()) {
                nc.add(lista.get(0));
            }
        }
        return nc;
    }

    @Override
    public List<NC> findNCbyFase(String fase) {
        List<NC> ncs = new ArrayList<NC>();
        Criteria criteria = getSession().createCriteria(NC.class);
        Criterion restrAzioni = criteriaByFase(fase);
        if (fase.equals("A")) {
            criteria.add(Restrictions.and(restrAzioni, Restrictions.isNull("dataC"), Restrictions.eq("enabled", 1)));
        } else if (fase.equals("I")) {
            criteria.add(Restrictions.and(restrAzioni, Restrictions.isNull("dataC"), Restrictions.eq("enabled", 1)));
        } else if (fase.equals("C")) {
            criteria.add(Restrictions.and(restrAzioni, Restrictions.isNotNull("dataC"), Restrictions.isNotNull("costoNC"), Restrictions.eq("enabled", 1)));
        }
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        return criteria.list();
    }

    @Override
    public List<NC> findAll() {
        Criteria criteria = getSession().createCriteria(NC.class).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        return (List<NC>) criteria.list();
    }

    public Criterion criteriaByFase(String fase) {
        Criterion criteria = null;
        if (fase.equals("A")) {
            criteria = Restrictions.and(
                    Restrictions.or(Restrictions.isNull("cause"), Restrictions.eq("cause", "")),
                    Restrictions.or(Restrictions.isNull("aContenimento"), Restrictions.eq("aContenimento", "")),
                    Restrictions.or(Restrictions.isNull("aCorrettiva"), Restrictions.eq("aCorrettiva", "")),
                    Restrictions.or(Restrictions.isNull("aPreventiva"), Restrictions.eq("aPreventiva", "")),
                    Restrictions.or(Restrictions.isNull("intesaComp"), Restrictions.eq("intesaComp", "")));
        } else if (fase.equals("I")) {
            criteria = Restrictions.or(
                    Restrictions.and(Restrictions.isNotNull("cause"), Restrictions.ne("cause", "")),
                    Restrictions.and(Restrictions.isNotNull("aContenimento"), Restrictions.ne("aContenimento", "")),
                    Restrictions.and(Restrictions.isNotNull("aCorrettiva"), Restrictions.ne("aCorrettiva", "")),
                    Restrictions.and(Restrictions.isNotNull("aPreventiva"), Restrictions.ne("aPreventiva", "")),
                    Restrictions.and(Restrictions.isNotNull("intesaComp"), Restrictions.ne("intesaComp", "")));
        } else if (fase.equals("C")) {
            criteria = Restrictions.and(
                    Restrictions.or(Restrictions.isNotNull("cause"), Restrictions.ne("cause", "")),
                    Restrictions.or(Restrictions.isNotNull("aContenimento"), Restrictions.ne("aContenimento", "")),
                    Restrictions.or(Restrictions.isNotNull("aCorrettiva"), Restrictions.ne("aCorrettiva", "")),
                    Restrictions.or(Restrictions.isNotNull("aPreventiva"), Restrictions.ne("aPreventiva", "")),
                    Restrictions.or(Restrictions.isNotNull("intesaComp"), Restrictions.ne("intesaComp", "")));
        }
        return criteria;
    }
//Non in uso in questo momento
    //non va I e C

    @Override
    public String getFase(int numeroNC) {
        Criteria criteria = getSession().createCriteria(NC.class).add(Restrictions.eq("numeroNC", numeroNC));
        if (criteria.add(Restrictions.and(criteriaByFase("A"), Restrictions.isNull("dataC"))).uniqueResult() != null) {
            return "Aperta";
        } else if (criteria.add(Restrictions.and(criteriaByFase("I"), Restrictions.isNull("dataC"))).uniqueResult() != null) {
            return "Intermedia";
        } else if (criteria.add(Restrictions.and(criteriaByFase("C"), Restrictions.isNotNull("dataC"), Restrictions.isNotNull("costoNC"))).uniqueResult() != null) {
            return "Chiusa";
        }
        return "Non definita";
    }

    @Override
    public List<NC> filterNC(List<NC> nc, String filter, int matricolaDip) {
        List<NC> result = new ArrayList<>();
        if (filter.compareTo("Leader") == 0) {
            for (NC ncItem : nc) {
                if (ncItem.getTeamLeader().getMatricola() == matricolaDip) {
                    result.add(ncItem);
                }
            }
        } else if (filter.compareTo("Richiedente") == 0) {
            for (NC ncItem : nc) {
                if (ncItem.getRichiedente().getMatricola() == matricolaDip) {
                    result.add(ncItem);
                }
            }
        } else if (filter.compareTo("Responsabile") == 0) {
            for (NC ncItem : nc) {
                Set<Responsabilita> responsabili = ncItem.getResponsabili();
                for (Responsabilita resp : responsabili) {
                    if (resp.getResponsabile().getMatricola() == matricolaDip) {
                        result.add(ncItem);
                    }
                }
            }
        } else if (filter.compareTo("Membro") == 0) {
            for (NC ncItem : nc) {
                Set<Appartenere> membri = ncItem.getMembri();
                for (Appartenere membro : membri) {
                    if (membro.getMembro().getMatricola() == matricolaDip) {
                        result.add(ncItem);
                    }
                }
            }
        }
        if (result.isEmpty()) {
            return nc;
        }
        return result;
    }

    @Override
    public int[] getCountByReparto() {
        int[] a = {0, 0, 0, 0, 0, 0};
        boolean empty = true;
        List<NC> ncs = getSession().createCriteria(NC.class).add(Restrictions.eq("enabled", 1)).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
        for (NC nc : ncs) {
            switch (nc.getRepartoP()) {
                case Amministrativo:
                    a[0] += 1;
                    empty = false;
                    break;
                case Commerciale:
                    a[1] += 1;
                    empty = false;
                    break;
                case LogisticaE:
                    a[2] += 1;
                    empty = false;
                    break;
                case LogisticaU:
                    a[3] += 1;
                    empty = false;
                    break;
                case Produzione:
                    a[4] += 1;
                    empty = false;
                    break;
                case Progettazione:
                    a[5] += 1;
                    empty = false;
                    break;
                default:
                    break;
            }
        }
        if (empty) {
            return null;
        }
        return a;
    }

    @Override
    public int[] getCountByFase() {
        int[] a = new int[3];
        a[0] = findNCbyFase("A").size();
        a[1] = findNCbyFase("I").size();
        a[2] = findNCbyFase("C").size();
        if (a[0] == 0 && a[1] == 0 && a[2] == 0) {
            return null;
        }
        return a;
    }

    @Override
    public int[] getCountByMese() {
        int[] a = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
        boolean empty = true;
        List<NC> ncs = getSession().createCriteria(NC.class).add(Restrictions.eq("enabled", 1)).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        int year = Calendar.getInstance().get(Calendar.YEAR);
        for (NC nc : ncs) {
            try {
                if (nc.getDataA().compareTo(sdf.parse("01/01/" + year)) >= 0 && nc.getDataA().compareTo(sdf.parse("31/01/" + year)) <= 0) {
                    a[0] += 1;
                    empty = false;
                }
                if (nc.getDataA().compareTo(sdf.parse("01/02/" + year)) >= 0 && nc.getDataA().compareTo(sdf.parse("28/02/" + year)) <= 0) {
                    a[1] += 1;
                    empty = false;
                }
                if (nc.getDataA().compareTo(sdf.parse("01/03/" + year)) >= 0 && nc.getDataA().compareTo(sdf.parse("31/03/" + year)) <= 0) {
                    a[2] += 1;
                    empty = false;
                }
                if (nc.getDataA().compareTo(sdf.parse("01/04/" + year)) >= 0 && nc.getDataA().compareTo(sdf.parse("30/04/" + year)) <= 0) {
                    a[3] += 1;
                    empty = false;
                }
                if (nc.getDataA().compareTo(sdf.parse("01/05/" + year)) >= 0 && nc.getDataA().compareTo(sdf.parse("31/05/" + year)) <= 0) {
                    a[4] += 1;
                    empty = false;
                }
                if (nc.getDataA().compareTo(sdf.parse("01/06/" + year)) >= 0 && nc.getDataA().compareTo(sdf.parse("30/06/" + year)) <= 0) {
                    a[5] += 1;
                    empty = false;
                }
                if (nc.getDataA().compareTo(sdf.parse("01/07/" + year)) >= 0 && nc.getDataA().compareTo(sdf.parse("31/07/" + year)) <= 0) {
                    a[6] += 1;
                    empty = false;
                }
                if (nc.getDataA().compareTo(sdf.parse("01/08/" + year)) >= 0 && nc.getDataA().compareTo(sdf.parse("31/08/" + year)) <= 0) {
                    a[7] += 1;
                    empty = false;
                }
                if (nc.getDataA().compareTo(sdf.parse("01/09/" + year)) >= 0 && nc.getDataA().compareTo(sdf.parse("30/09/" + year)) <= 0) {
                    a[8] += 1;
                    empty = false;
                }
                if (nc.getDataA().compareTo(sdf.parse("01/10/" + year)) >= 0 && nc.getDataA().compareTo(sdf.parse("31/10/" + year)) <= 0) {
                    a[9] += 1;
                    empty = false;
                }
                if (nc.getDataA().compareTo(sdf.parse("01/11/" + year)) >= 0 && nc.getDataA().compareTo(sdf.parse("30/11/" + year)) <= 0) {
                    a[10] += 1;
                    empty = false;
                }
                if (nc.getDataA().compareTo(sdf.parse("01/12/" + year)) >= 0 && nc.getDataA().compareTo(sdf.parse("31/12/" + year)) <= 0) {
                    a[11] += 1;
                    empty = false;
                }
            } catch (ParseException ex) {
                Logger.getLogger(NCDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (empty) {
            return null;
        }
        return a;
    }
}
